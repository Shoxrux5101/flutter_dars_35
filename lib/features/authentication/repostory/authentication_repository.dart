import 'package:untitled3/core/network/dio_client.dart';
import 'package:untitled3/core/utils/result.dart';
import '../../../data/models/home/login_model.dart';

class AuthenticationRepository {
  final DioClient _dioClient;

  AuthenticationRepository({required DioClient dioClient}) : _dioClient = dioClient;

  Future<Result<LoginModel>> login(String login, String password) async {
    try {
      final response = await _dioClient.post(
        '/login',
        data: {'login': login, 'password': password,},
      );
      return response.fold(
        (error) => Result.error(error),
        (success) {
          try {
            final loginModel = LoginModel.fromJson(success);
            return Result.ok(loginModel);
          } catch (e) {
            return Result.error(Exception("JSON parse error: $e"));
          }
        },
      );
    } catch (e) {
      throw Exception("error: $e");
    }
  }
  Future<Result> register(
    String username,
    String lastname,
    String password,
  ) async {
    final response = await _dioClient.post(
      "/register",
      data: {
        'username': username,
        'lastname': lastname,
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
