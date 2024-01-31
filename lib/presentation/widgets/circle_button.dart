import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double borderRadius;
  final BoxBorder? border;

  const CircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.backgroundColor,
    this.border,
    this.borderRadius = 48
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        onTap: onPressed,
        child: icon
      )
    );
  }
}
