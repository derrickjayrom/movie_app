import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

class DiscoveryProvider extends ChangeNotifier {
  final MovieService _service = MovieService();

  bool _isLoading = false;
  String? _error;
  List<Movie> _results = [];

  String _query = '';
  int? _selectedGenreId;
  String _sortBy = 'popularity.desc';

  bool get isLoading => _isLoading;
  String? get error => _error;
  List<Movie> get results => _results;

  String get query => _query;
  int? get selectedGenreId => _selectedGenreId;
  String get sortBy => _sortBy;

  Future<void> init() async {
    if (_results.isNotEmpty || _isLoading) return;
    await refresh();
  }

  Future<void> setQuery(String value) async {
    _query = value;
    notifyListeners();
    await refresh();
  }

  Future<void> setGenre(int? genreId) async {
    _selectedGenreId = genreId;
    notifyListeners();
    await refresh();
  }

  Future<void> setSortBy(String value) async {
    _sortBy = value;
    notifyListeners();
    await refresh();
  }

  Future<void> refresh() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _results = await _service.discoverMovies(
        query: _query,
        genreId: _selectedGenreId,
        sortBy: _sortBy,
      );
    } catch (e) {
      _error = e.toString();
      _results = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clear({bool notify = true}) {
    _isLoading = false;
    _error = null;
    _results = [];
    _query = '';
    _selectedGenreId = null;
    _sortBy = 'popularity.desc';

    if (notify) {
      notifyListeners();
    }
  }
}
