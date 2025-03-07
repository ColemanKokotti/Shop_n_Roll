import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback onPressed;

  const AnimatedButton({super.key, required this.onPressed});

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context);
    return FadeTransition(
      opacity: _animation,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Text('Let \'s go shopping',style: TextStyle(color: theme.textTheme.labelLarge?.color),),
        ),
      ),
    );
  }
}
