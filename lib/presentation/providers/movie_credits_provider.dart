import 'package:flutter/material.dart';
import 'package:movie_app/data/services/movie_service.dart';

class MovieCreditsProvider extends ChangeNotifier {
  final MovieService _service = MovieService();

  bool _isLoading = true;
  String? _director;
  List<Map<String, dynamic>> _cast = [];

  bool get isLoading => _isLoading;
  String? get director => _director;
  List<Map<String, dynamic>> get cast => _cast;

  Future<void> loadCredits(int movieId) async {
    _isLoading = true;
    _director = null;
    _cast = [];
    notifyListeners();

    final credits = await _service.getMovieCredits(movieId);

    if (credits != null) {
      final crew = (credits['crew'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      final directorEntry = crew.cast<Map<String, dynamic>>().firstWhere(
            (c) => (c['job'] as String?) == 'Director',
            orElse: () => const <String, dynamic>{},
          );
      _director = (directorEntry['name'] as String?);

      final castList = (credits['cast'] as List?)?.cast<Map<String, dynamic>>() ?? [];
      _cast = castList.cast<Map<String, dynamic>>();
    }

    _isLoading = false;
    notifyListeners();
  }

  void clear({bool notify = true}) {
    _isLoading = true;
    _director = null;
    _cast = [];
    if (notify) {
      notifyListeners();
    }
  }
}
