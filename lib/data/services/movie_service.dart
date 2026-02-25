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

  Future<String?> getMovieTrailer(int movieId) async {
    try {
      final response = await _dio.get('/movie/$movieId/videos');
      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'];
        final trailer = results.firstWhere(
          (v) => v['type'] == 'Trailer' && v['site'] == 'YouTube',
          orElse: () => null,
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
}
