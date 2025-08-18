import 'package:flutter/cupertino.dart';
import '../../../core/network/api_client.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repository/login/repository/login_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository _repository = LoginRepository(client: ApiClient());

  bool isLoading = false;
  String? error;
  LoginModel? user;

  Future<void> login(String login, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      user = (await _repository.loginUser(login, password)) as LoginModel?;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
