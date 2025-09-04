import 'package:dio/dio.dart';

final dio = Dio (
  BaseOptions(
    baseUrl: "https://da868218f983.ngrok-free.app/api/v1",
    validateStatus: (status) => true,
  )
);

