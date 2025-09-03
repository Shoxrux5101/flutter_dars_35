import 'package:untitled3/core/network/api_client.dart';
import 'package:untitled3/core/utils/result.dart';
import 'package:untitled3/data/models/login_model.dart';

class LoginRepository {
  final ApiClient _client;

  LoginRepository({required ApiClient client}) : _client = client;

  Future<Result<LoginModel>> loginUser(String login, String password) async {
    try {
      final response = await _client.post(
        '/login',
        data: {
          'login': login,
          'password': password,
        },
      );

      if (response is Map<String, dynamic>) {
        return Result.ok(LoginModel.fromJson(response as Map<String, dynamic>));
      } else {
        return Result.error(Exception('Invalid response format'));
      }
    } on Exception catch (e) {
      return Result.error(e);
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
