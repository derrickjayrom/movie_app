import 'package:flutter/material.dart';

class MovieDetailsCloseButton extends StatelessWidget {
  final VoidCallback onClose;

  const MovieDetailsCloseButton({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      right: 20,
      child: Material(
        color: Colors.black.withValues(alpha: .5),
        borderRadius: BorderRadius.circular(999),
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: onClose,
          child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(Icons.close, color: Colors.white, size: 24),
          ),
        ),
      ),
    );
  }
}
