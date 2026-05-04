import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/core/constants/api_constants.dart';

class DioClient {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Authorization': 'Bearer ${ApiConstants.token}',
        'accept': 'application/json',
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, handler) {
          if (kDebugMode) {
            print("Global Fetch Error: ${e.message}");
          }
          return handler.next(e);
        },
      ),
    );
}
