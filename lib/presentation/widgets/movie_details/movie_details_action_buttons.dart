import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';
import 'package:movie_app/presentation/widgets/movie_details/action_icon.dart';

class MovieDetailsActionButtons extends StatelessWidget {
  final TrailerProvider trailerProvider;
  final bool isLoading;
  final VoidCallback onWatchTrailer;

  const MovieDetailsActionButtons({
    super.key,
    required this.trailerProvider,
    required this.isLoading,
    required this.onWatchTrailer,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade700,
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: trailerProvider.trailerKey != null
                ? onWatchTrailer
                : null,
            icon: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(Icons.play_arrow_rounded, size: 28),
            label: Text(
              isLoading ? "Loading..." : "Watch Trailer",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Gap(16),
        ActionIcon(Icons.add_rounded, onPressed: () {}),
        const Gap(12),
        ActionIcon(Icons.share_rounded, onPressed: () {}),
      ],
    );
  }
}
