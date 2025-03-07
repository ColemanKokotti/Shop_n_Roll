import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final ThemeData theme;
  final int? maxLines;
  final int? minLines;

  const TextFieldWidget({super.key, 
    required this.controller,
    required this.labelText,
    required this.theme,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: theme.textTheme.labelLarge?.color),
        filled: true,
        fillColor: theme.textTheme.labelLarge?.backgroundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      style: TextStyle(color: theme.textTheme.labelLarge?.color),
      maxLines: maxLines,
      minLines: minLines,
    );
  }
}
