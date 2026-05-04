import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: .5),
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
