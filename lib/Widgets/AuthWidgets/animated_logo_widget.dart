import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedLogoWidget extends StatefulWidget {
  // Aggiungiamo un parametro per controllare se la tastiera è visibile
  final bool keyboardVisible;

  const AnimatedLogoWidget({
    super.key,
    this.keyboardVisible = false,
  });

  @override
  State<AnimatedLogoWidget> createState() => _AnimatedLogoWidgetState();
}

class _AnimatedLogoWidgetState extends State<AnimatedLogoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _linearVibrationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    // Rotation animation for guitar logo
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * math.pi,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );

    // Linear vibration animation for name logo
    _linearVibrationAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: 10.0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 10.0, end: 0.0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.0, end: -10.0),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: -10.0, end: 0.0),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Adattare le dimensioni in base allo stato della tastiera
    final double guitarLogoSize = widget.keyboardVisible ? 40.0 : 80.0;
    final double nameLogoWidth = widget.keyboardVisible ? 120.0 : 160.0;
    final double nameLogoHeight = widget.keyboardVisible ? 30.0 : 40.0;
    final double spacing = widget.keyboardVisible ? 4.0 : 8.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Rotating guitar logo
        AnimatedBuilder(
          animation: _rotationAnimation,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value,
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/chitarra_logo.png',
            width: guitarLogoSize,
            height: guitarLogoSize,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(height: spacing),
        // Smoothly vibrating name logo
        AnimatedBuilder(
          animation: _linearVibrationAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_linearVibrationAnimation.value, 0),
              child: child,
            );
          },
          child: Image.asset(
            'assets/images/name_logo.png',
            width: nameLogoWidth,
            height: nameLogoHeight,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}