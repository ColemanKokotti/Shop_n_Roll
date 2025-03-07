import 'package:flutter/material.dart';
import '../Data/data_items.dart';

class ListDetailed extends StatelessWidget {
  final Item item;

  const ListDetailed({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        centerTitle: true,
        title: Text(item.nameItem, style: TextStyle(color: theme.appBarTheme.titleTextStyle?.color)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getWidgetFromString(item.iconItem, size: 100, color: theme.iconTheme.color),
            const SizedBox(height: 20),
            Text(
              item.nameItem,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: theme.textTheme.labelLarge?.color,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                item.descriptionItem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: theme.textTheme.labelLarge?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
