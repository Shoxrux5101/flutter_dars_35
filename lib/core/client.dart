import 'package:dio/dio.dart';

final dio = Dio (
  BaseOptions(
    baseUrl: "http://localhost:8888/api/v1",
    validateStatus: (status) => true,
  )
);

