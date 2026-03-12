import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/services/movie_service.dart';

class MovieProvider extends ChangeNotifier {
  final MovieService _service = MovieService();

  List<Movie> _movies = [];
  bool _isLoading = false;
  String? _error;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchTrendingMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      _movies = await _service.getTrendingMovies();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
