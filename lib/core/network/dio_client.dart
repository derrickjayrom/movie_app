import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Authorization': 'Bearer ${ApiConstants.token}',
        'accept': 'application/json',
      },
    ),
  );
}
