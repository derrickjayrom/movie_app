import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerProvider extends ChangeNotifier {
  final MovieService _service = MovieService();

  YoutubePlayerController? _controller;
  bool _isLoading = true;
  String? _trailerKey;

  YoutubePlayerController? get controller => _controller;
  bool get isLoading => _isLoading;
  String? get trailerKey => _trailerKey;

  Future<void> loadTrailer(int movieId) async {
    clear();

    final key = await _service.getMovieTrailer(movieId);

    _trailerKey = key;

    if (key != null) {
      _controller = YoutubePlayerController(
        initialVideoId: key,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear({bool notify = true}) {
    _controller?.dispose();
    _controller = null;
    _trailerKey = null;
    _isLoading = true;
    if (notify) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
