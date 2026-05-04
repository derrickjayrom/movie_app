import 'package:flutter/material.dart';

class ActionIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const ActionIcon(this.icon, {super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Icon(icon, color: Colors.white, size: 26),
        ),
      ),
    );
  }
}
