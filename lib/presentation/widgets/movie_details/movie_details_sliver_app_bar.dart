import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/widgets/movie_details/movie_header.dart';

class MovieDetailsSliverAppBar extends StatelessWidget {
  final Movie movie;
  final Widget? player;
  final bool showTrailer;
  final VoidCallback onCloseTrailer;
  final VoidCallback onTogglePlayPause;

  const MovieDetailsSliverAppBar({
    super.key,
    required this.movie,
    this.player,
    required this.showTrailer,
    required this.onCloseTrailer,
    required this.onTogglePlayPause,
    
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 350,
      pinned: true,
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(0.5),
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: MovieHeader(
          movie: movie,
          player: player,
          showTrailer: showTrailer,
          onCloseTrailer: onCloseTrailer,
          onTogglePlayPause: onTogglePlayPause,
         
        ),
      ),
    );
  }
}
