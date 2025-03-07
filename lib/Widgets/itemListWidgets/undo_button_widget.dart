import 'package:flutter/material.dart';

class UndoButtonWidget extends StatefulWidget {
  final Function() onUndo;

  const UndoButtonWidget({
    super.key,
    required this.onUndo,
  });

  @override
  _UndoButtonWidgetState createState() => _UndoButtonWidgetState();
}

class _UndoButtonWidgetState extends State<UndoButtonWidget> {
  late bool _isVisible;

  @override
  void initState() {
    super.initState();
    _isVisible = true;

    Future.delayed(Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isVisible) return SizedBox.shrink();

    final theme = Theme.of(context);

    return Positioned(
      bottom: 60,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            widget.onUndo();
            setState(() {
              _isVisible = false;
            });
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.primaryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.undo,
              size: 30,
              color: theme.iconTheme.color,
            ),
          ),
        ),
      ),
    );
  }
}
