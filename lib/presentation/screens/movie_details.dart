import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/presentation/widgets/movie_info_section.dart';
import 'package:movie_app/presentation/widgets/movie_trailer_player.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetails extends StatefulWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  YoutubePlayerController? _controller;
  bool _isLoadingTrailer = true;
  String? _trailerKey;

  @override
  void initState() {
    super.initState();
    _loadTrailer();
  }

  Future<void> _loadTrailer() async {
    final key = await MovieService().getMovieTrailer(widget.movie.id);
    if (mounted) {
      setState(() {
        _trailerKey = key;
        _isLoadingTrailer = false;
        if (key != null) {
          _controller = YoutubePlayerController(
            initialVideoId: key,
            flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                widget.movie.title,
                style: const TextStyle(
                  textBaseline: TextBaseline.alphabetic,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 3.0,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              background: MovieTrailerPlayer(
                controller: _controller,
                isLoading: _isLoadingTrailer,
                trailerKey: _trailerKey,
                backdropPath: widget.movie.backdropPath ?? '',
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              MovieInfoSection(movie: widget.movie),
            ]),
          ),
        ],
      ),
    );
  }
}
