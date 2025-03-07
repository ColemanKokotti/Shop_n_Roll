import 'package:cloud_firestore/cloud_firestore.dart';
import '../Bloc|Cubit/CreateItemCubit/create_item_state.dart';

class ItemService {
  final CollectionReference _itemsCollection = FirebaseFirestore.instance.collection('Items');

  Future<bool> addItemToFirestore(AddButtonState state) async {
    if (state.nameItem.isEmpty || state.descriptionItem.isEmpty || state.selectedIcon.isEmpty) {
      return false;
    }

    try {
      await _itemsCollection.add({
        'nameItem': state.nameItem,
        'iconItem': state.selectedIcon,
        'descriptionItem': state.descriptionItem,
        'quantity': state.quantity,
        'imageUrl': state.imageUrl,
      });
      return true;
    } catch (e) {
      print("Errore nell'aggiungere l'elemento: $e");
      return false;
    }
  }
}
