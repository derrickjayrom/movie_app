import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<Movie> _trendingMovies = [];
  List<Movie> _popularMovies = [];
  List<Movie> _topRatedMovies = [];
  Map<int, String> _genres = {};
  bool _isLoading = false;
  bool _isSearchLoading = false;
  String? _error;

  List<Movie> get trendingMovies => _trendingMovies;
  List<Movie> get popularMovies => _popularMovies;
  List<Movie> get topRatedMovies => _topRatedMovies;
  Map<int, String> get genres => _genres;
  bool get isLoading => _isLoading;
  bool get isSearchLoading => _isSearchLoading;
  String? get error => _error;

  String getGenreName(int id) => _genres[id] ?? 'Unknown';

  Future<void> fetchAllMovies() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _service.getTrendingMovies(),
        _service.getPopularMovies(),
        _service.getTopRatedMovies(),
        _service.getGenres(),
      ]);

      _trendingMovies = results[0] as List<Movie>;
      _popularMovies = results[1] as List<Movie>;
      _topRatedMovies = results[2] as List<Movie>;

      final genreList = results[3] as List<Genre>;
      _genres = {for (var g in genreList) g.id: g.name};
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchTrendingMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _trendingMovies = await _service.getTrendingMovies();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  List<Movie> _searchResults = [];
  String _searchQuery = '';

  List<Movie> get searchResults => _searchResults;
  String get searchQuery => _searchQuery;

  Future<void> searchMovies(String query) async {
    _searchQuery = query;
    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _isSearchLoading = true;
    notifyListeners();

    try {
      _searchResults = await _service.searchMovies(query);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isSearchLoading = false;
      notifyListeners();
    }
  }

  void clearSearch() {
    _searchQuery = '';
    _searchResults = [];
    notifyListeners();
  }

  Future<Movie?> getMovieById(int id) async {
    try {
      final movies = await _service.searchMovies(id.toString());
      return movies.isNotEmpty ? movies.first : null;
    } catch (e) {
      return null;
    }
  }
}
