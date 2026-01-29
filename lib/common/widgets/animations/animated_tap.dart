import 'package:flutter/material.dart';

class AnimatedTap extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;

  const AnimatedTap({
    super.key,
    required this.child,
    required this.onTap,
  });

  @override
  State<AnimatedTap> createState() => _AnimatedTapState();
}

class _AnimatedTapState extends State<AnimatedTap> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        curve: Curves.easeOut,
        child: AnimatedOpacity(
          opacity: _pressed ? 0.9 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: widget.child,
        ),
      ),
    );
  }
}