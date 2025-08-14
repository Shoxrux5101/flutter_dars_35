import 'package:dio/dio.dart';

import '../utils/result.dart';

class DioClient {
  final _dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.8.189:8888/api/v1",
      validateStatus: (status) => true,
      connectTimeout: const Duration(seconds: 3),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<Result<T>> get<T>(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      var response = await _dio.get(path, queryParameters: queryParams);
      if (response.statusCode != 200) {
        return Result.error(Exception(response.data.toString()));
      }
      return Result.ok(response.data as T);
    } on Exception catch (exception) {
      return Result.error(exception);
    }
  }

  Future<Result<T>> post<T>(String path, {required Map<String, dynamic> data}) async {
    try {
      var response = await _dio.post(path, data: data);
      if (response.statusCode != 200 && response.statusCode != 201) {
        return Result.error(Exception(response.data.toString()));
      }
      return Result.ok(response.data as T);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}