import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:movie_app/presentation/providers/movie_credits_provider.dart';

class MovieDetailsDirector extends StatelessWidget {
  const MovieDetailsDirector({super.key});

  @override
  Widget build(BuildContext context) {
    final creditsProvider = context.watch<MovieCreditsProvider>();
    final directorName = creditsProvider.director ?? 'N/A';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Director",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const Gap(12),
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey.shade900,
              child: const Icon(Icons.person, color: Colors.white54, size: 20),
            ),
            const Gap(12),
            Text(
              directorName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
