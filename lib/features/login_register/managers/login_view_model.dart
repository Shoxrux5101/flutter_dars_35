import 'package:flutter/material.dart';
import '../../../data/models/login_model.dart';
import '../../../data/repository/authentication/repository/authentication_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthenticationRepository _repository;

  LoginViewModel({required AuthenticationRepository repository}) : _repository = repository;

  bool _isLoading = false;
  String? _errorMessage;
  LoginModel? _loginModel;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  LoginModel? get loginModel => _loginModel;
  bool get isLoggedIn => _loginModel != null;

  Future<void> login(String username, String password) async {
    _setLoading(true);
    _clearError();

    final result = await _repository.login(username, password);

    result.fold(
          (error) {
        _setError(error.toString());
        _loginModel = null;
      },
          (loginModel) {
        _loginModel = loginModel;
        _errorMessage = null;
      },
    );
    _setLoading(false);
  }
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
  void _setError(String error) {
    _errorMessage = error;
    notifyListeners();
  }
  void _clearError() {
    _errorMessage = null;
    notifyListeners();
  }
  void logout() {
    _loginModel = null;
    _errorMessage = null;
    notifyListeners();
  }
}