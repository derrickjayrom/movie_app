import 'package:flutter/material.dart';

class CastChip extends StatelessWidget {
  final String name;
  const CastChip(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Text(
        name,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}
