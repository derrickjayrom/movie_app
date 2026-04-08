import 'package:flutter/foundation.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:dio/dio.dart';

class MovieService {
  final Dio _dio = DioClient().dio;

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await _dio.get(
        '/trending/movie/day',
        queryParameters: {'language': 'en-US'},
      );

      if (response.statusCode == 200) {
        List<dynamic> results = response.data['results'];
        return results.map((m) => Movie.fromJson(m)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Dio Error: ${e.message}");
      }
      return [];
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    try {
      final response = await _dio.get(
        '/movie/popular',
        queryParameters: {'language': 'en-US'},
      );

      final movieResponse = MovieResponse.fromJson(response.data);
      return movieResponse.results;
    } catch (e) {
      throw Exception('Failed to load popular movies: $e');
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    try {
      final response = await _dio.get(
        '/movie/top_rated',
        queryParameters: {'language': 'en-US'},
      );

      if (response.statusCode == 200) {
        final movieResponse = MovieResponse.fromJson(response.data);
        return movieResponse.results;
      } else {
        throw Exception('Failed to load top rated movies');
      }
    } on DioException catch (e) {
      if (kDebugMode) {
        print("Top Rated Movies Error: ${e.message}");
      }
      return [];
    }
  }

  Future<String?> getMovieTrailer(int movieId) async {
    try {
      final response = await _dio.get('/movie/$movieId/videos');

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];

        final trailer = results.firstWhere(
          (v) => v['type'] == 'Trailer' && v['site'] == 'YouTube',
          orElse: () => results.firstWhere(
            (v) => v['site'] == 'YouTube',
            orElse: () => null,
          ),
        );

        return trailer != null ? trailer['key'] : null;
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching trailer: $e");
      }
    }
    return null;
  }

  Future<List<Genre>> getGenres() async {
    try {
      final response = await _dio.get(
        '/genre/movie/list',
        queryParameters: {'language': 'en-US'},
      );

      if (response.statusCode == 200) {
        final genreResponse = GenreResponse.fromJson(response.data);
        return genreResponse.genres;
      } else {
        throw Exception('Failed to load genres');
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching genres: $e");
      }
      return [];
    }
  }
  Future<List<Movie>> searchMovies(String query) async {
    try {
      final response = await _dio.get(
        '/search/movie',
        queryParameters: {
          'query': query,
          'language': 'en-US',
          'include_adult': false,
        },
      );

      if (response.statusCode == 200) {
        final movieResponse = MovieResponse.fromJson(response.data);
        return movieResponse.results;
      }
      return [];
    } catch (e) {
      if (kDebugMode) {
        print("Search error: $e");
      }
      return [];
    }
  }
}
