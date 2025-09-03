import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';

class AuthenticationRepository {
  final ApiClient _dioClient;
  AuthenticationRepository({required ApiClient dioClient}) : _dioClient = dioClient;

  Future<Result> login(String login, String password) async {
    final response = await _dioClient.post(
      '/login',
      data: {'login': login, 'password': password},
    );
    return response.fold(
          (error) => Result.error(error),
          (success) => Result.ok(success),
    );
  }
  Future<Result> register(
    String username,
    String password,
  ) async {
    final response = await _dioClient.post(
      "/register",
      data: {
        'username': username,
        'password': password,
      },
    );
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success),
    );
  }
  Future<Result> forgetPassword(
    String email,
  ) async {
    final response = await _dioClient.post(
      "/forget-password",
      data: {'email': email,},
    );
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success),
    );
  }
  Future<Result> otpCode(
    String code,
  ) async {
    final response = await _dioClient.post(
      "/otp-code",
      data: {'code': code,},
    );
    return response.fold(
      (error) => Result.error(error),
      (success) => Result.ok(success),
    );
  }
}
