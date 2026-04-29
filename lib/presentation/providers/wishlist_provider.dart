import 'package:flutter/material.dart';
import 'package:movie_app/data/models/movie_model.dart';

class WishlistProvider extends ChangeNotifier {
  final Map<int, Movie> _itemsById = {};

  List<Movie> get items => _itemsById.values.toList();

  bool contains(Movie movie) => _itemsById.containsKey(movie.id);

  void toggle(Movie movie) {
    if (_itemsById.containsKey(movie.id)) {
      _itemsById.remove(movie.id);
    } else {
      _itemsById[movie.id] = movie;
    }
    notifyListeners();
  }

  void remove(Movie movie) {
    if (_itemsById.remove(movie.id) != null) {
      notifyListeners();
    }
  }

  void clear() {
    _itemsById.clear();
    notifyListeners();
  }
}
