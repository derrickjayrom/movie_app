import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_app/core/constants/api_constants.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/providers/trailer_provider.dart';

class MovieHeader extends StatefulWidget {
  final Movie movie;
  final Widget? player;
  final bool showTrailer;
  final VoidCallback onCloseTrailer;
  final VoidCallback onTogglePlayPause;

  const MovieHeader({
    super.key,
    required this.movie,
    this.player,
    required this.showTrailer,
    required this.onCloseTrailer,
    required this.onTogglePlayPause,
  });

  @override
  State<MovieHeader> createState() => _MovieHeaderState();
}

class _MovieHeaderState extends State<MovieHeader> {
  late final String? posterUrl;

  @override
  void initState() {
    super.initState();
    posterUrl = widget.movie.posterPath != null
        ? '${ApiConstants.imageBaseUrl}${widget.movie.posterPath}'
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: widget.showTrailer && widget.player != null
              ? Stack(
                  key: const ValueKey('trailer'),
                  fit: StackFit.expand,
                  children: [widget.player!],
                )
              : (posterUrl != null
                    ? Hero(
                        tag: 'movie-poster-${widget.movie.id}',
                        child: CachedNetworkImage(
                          imageUrl: posterUrl!,
                          fit: BoxFit.cover,
                          key: const ValueKey('poster'),
                        ),
                      )
                    : Container(
                        key: const ValueKey('empty'),
                        color: Colors.grey.shade900,
                      )),
        ),

        IgnorePointer(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withValues(alpha: .8),
                  Colors.transparent,
                  Colors.black.withValues(alpha: .6),
                  Colors.black,
                ],
                stops: const [0.0, 0.4, 0.7, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ),

        if (widget.showTrailer)
          Positioned(
            bottom: 20,
            right: 20,
            child: Material(
              color: Colors.black.withValues(alpha: .5),
              borderRadius: BorderRadius.circular(999),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: widget.onTogglePlayPause,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Selector<TrailerProvider, bool>(
                    selector: (_, provider) =>
                        provider.controller?.value.isPlaying ?? false,
                    builder: (_, isPlaying, __) {
                      return Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        color: Colors.white,
                        size: 28,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
