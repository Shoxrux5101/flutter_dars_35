import 'package:dio/dio.dart';

final dio = Dio (
  BaseOptions(
    baseUrl: 'https://7a3c890bf239.ngrok-free.app/api/v1',
    validateStatus: (status) => true,
  )
);

