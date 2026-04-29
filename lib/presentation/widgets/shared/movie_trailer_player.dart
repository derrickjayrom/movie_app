import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPlayer extends StatelessWidget {
  final YoutubePlayerController? controller;
  final bool isLoading;
  final String? trailerKey;
  final String backdropPath;

  const MovieTrailerPlayer({
    super.key,
    required this.controller,
    required this.isLoading,
    required this.trailerKey,
    required this.backdropPath,
  });

  @override
  Widget build(BuildContext context) {
    if (controller != null) {
      return YoutubePlayer(
        controller: controller!,
        showVideoProgressIndicator: true,
      );
    }

    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          '${ApiConstants.imageBaseUrl}$backdropPath',
          fit: BoxFit.cover,
        ),
        if (isLoading)
          const Center(child: CircularProgressIndicator())
        else if (trailerKey == null)
          const Center(child: Icon(Icons.error, color: Colors.white, size: 50)),
      ],
    );
  }
}
