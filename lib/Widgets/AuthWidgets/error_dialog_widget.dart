import 'package:flutter/material.dart';

void showErrorDialog(BuildContext context, String message) {
  final theme = Theme.of(context);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: theme.appBarTheme.backgroundColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Error',
              style: TextStyle(
                color: theme.appBarTheme.foregroundColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              message,
              style: TextStyle(
                color: theme.appBarTheme.foregroundColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    },
  );

  Future.delayed(Duration(seconds: 2), () {
    Navigator.of(context).pop();
  });
}
