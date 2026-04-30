import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MovieDetailsSynopsis extends StatelessWidget {
  final String synopsis;

  const MovieDetailsSynopsis({super.key, required this.synopsis});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Synopsis",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 0.5,
          ),
        ),
        const Gap(12),
        Text(
          synopsis,
          style: TextStyle(
            color: Colors.white.withValues(alpha: .7),
            height: 1.6,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
