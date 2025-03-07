import 'package:flutter/material.dart';

Future<bool> showDeleteConfirmationDialog(BuildContext context) async {
  final theme = Theme.of(context);

  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          'Conferma eliminazione',
          textAlign: TextAlign.center,
        ),
        titleTextStyle: TextStyle(
          color: theme.textTheme.labelLarge?.color,
          fontSize: 30,
        ),
        content: Text(
          'Sei sicuro di voler eliminare questo elemento?',
          style: TextStyle(
            color: theme.textTheme.labelLarge?.color,
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: TextButton.styleFrom(
                  backgroundColor: theme.secondaryHeaderColor,
                ),
                child: Text(
                  'Annulla',
                  style: TextStyle(
                    color: theme.textTheme.labelLarge?.color,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(width: 10),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: TextButton.styleFrom(
                  backgroundColor: theme.secondaryHeaderColor,
                ),
                child: Text(
                  'Elimina',
                  style: TextStyle(
                    color: theme.textTheme.labelLarge?.color,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    },
  ) ?? false;
}
