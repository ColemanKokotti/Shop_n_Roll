import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Bloc|Cubit/CreateItemCubit/create_item_cubit.dart';
import '../Widgets/CreateItemWidgets/create_item_button.dart';
import 'settings_screen.dart';
import '../Widgets/itemListWidgets/list_item_widget.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => AddButtonCubit(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.appBarTheme.backgroundColor,
          centerTitle: true,
          title: Text('Shop ‘n’ Roll 🎸', style: TextStyle(color: theme.appBarTheme.titleTextStyle?.color)),
          actions: [
            IconButton(
              icon: Icon(
                  Icons.settings,
                  color: theme.appBarTheme.iconTheme?.color
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ItemListWidget(),
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20.0, right: 20.0),
          child: CreateItemButton(),
        ),
      ),
    );
  }
}
