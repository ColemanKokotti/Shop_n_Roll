import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_n_roll/Widgets/itemListWidgets/undo_button_widget.dart';
import '../../Bloc|Cubit/BuyedCubit/bought_item_cubit.dart';
import '../../Bloc|Cubit/ItemListCubit/item_list_state.dart';
import 'icon_selector_button.dart';
import '../../Data/data_items.dart';
import '../../FireBase/item_firebase_storage.dart';
import '../../Screens/list_detailed_screen.dart';
import '../../Bloc|Cubit/ItemListCubit/item_list_cubit.dart';
import 'delete_item_widget.dart';
import 'bought_item_button_widget.dart';

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ItemFirebaseStorage itemFirebaseStorage = ItemFirebaseStorage();

    return BlocProvider(
      create: (context) => ItemListCubit(itemFirebaseStorage),
      child: BlocBuilder<ItemListCubit, ItemListState>(
        builder: (context, state) {
          final itemListCubit = context.read<ItemListCubit>();

          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Items').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('Errore nel caricamento dei dati'));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                return Center(child: Text('Nessun elemento trovato'));
              }

              return Stack(
                children: [
                  ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      Map data = document.data() as Map;
                      String nameItem = data['nameItem'] ?? 'Nome non disponibile';
                      String iconItem = data['iconItem'] ?? 'error';
                      String descriptionItem = data['descriptionItem'] ?? 'Nessuna descrizione';
                      int quantity = (data['quantity'] ?? 0) is int
                          ? (data['quantity'] ?? 0)
                          : int.tryParse(data['quantity']?.toString() ?? '0') ?? 0;
                      String documentId = document.id;

                      Item item = Item(
                        nameItem: nameItem,
                        iconItem: iconItem,
                        descriptionItem: descriptionItem,
                      );

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Dismissible(
                          key: Key(documentId),
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            color: Colors.redAccent,
                            child: Icon(
                              Icons.delete,
                              color: theme.iconTheme.color,
                            ),
                          ),
                          confirmDismiss: (direction) {
                            return showDeleteConfirmationDialog(context);
                          },
                          onDismissed: (direction) {
                            itemListCubit.deleteItem(documentId);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Card(
                              elevation: 8,
                              shadowColor: theme.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(color: theme.primaryColor, width: 2),
                              ),
                              color: theme.cardColor,
                              child: ListTile(
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                                leading: IconSelectorButton(
                                  currentIconName: iconItem,
                                  documentId: documentId,
                                  onIconChanged: (newIcon) {},
                                ),
                                title: Text(
                                  nameItem,
                                  style: TextStyle(
                                    color: theme.textTheme.labelLarge?.color,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                subtitle: Text(
                                  descriptionItem,
                                  style: TextStyle(
                                    color: theme.textTheme.labelLarge?.color,
                                    fontSize: 12,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove, color: theme.iconTheme.color),
                                      onPressed: () {
                                        itemListCubit.updateQuantity(documentId, quantity - 1);
                                      },
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: theme.primaryColorLight,
                                      ),
                                      child: Text(
                                        '$quantity',
                                        style: TextStyle(
                                          color: theme.textTheme.labelLarge?.color,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add, color: theme.iconTheme.color),
                                      onPressed: () {
                                        itemListCubit.updateQuantity(documentId, quantity + 1);
                                      },
                                    ),
                                    BlocProvider(
                                      create: (_) => BuyedItemCubit(),
                                      child: BoughtItemButtonWidget(),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ListDetailed(item: item),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  if (state.deletedItem != null)
                    UndoButtonWidget(
                      onUndo: () => itemListCubit.undoDelete(),
                    ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

