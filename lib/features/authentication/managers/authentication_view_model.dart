import 'package:flutter/material.dart';

import '../../../data/repository/authentication/authentication_repository.dart';

class AuthenticationViewModel extends ChangeNotifier {
  final AuthenticationRepository _repository;

  AuthenticationViewModel({required AuthenticationRepository repository})
      : _repository = repository;

  bool isLoading = false;
  String? error;
  dynamic data;

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  void _setError(String? message) {
    error = message;
    notifyListeners();
  }

  Future<void> login(String login, String password) async {
    _setLoading(true);
    error = null;

    final result = await _repository.login(login, password);
    result.fold(
          (err) => _setError(err.toString()),
          (success) {
        data = success;
        notifyListeners();
      },
    );

    _setLoading(false);
  }

  Future<void> register(String username, String password) async {
    _setLoading(true);
    error = null;

    final result = await _repository.register(username, password);
    result.fold(
          (err) => _setError(err.toString()),
          (success) {
        data = success;
        notifyListeners();
      },
    );

    _setLoading(false);
  }

  Future<void> forgetPassword(String email) async {
    _setLoading(true);
    error = null;

    final result = await _repository.forgetPassword(email);
    result.fold(
          (err) => _setError(err.toString()),
          (success) {
        data = success;
        notifyListeners();
      },
    );

    _setLoading(false);
  }
  Future<void> otpCode(String code) async {
    _setLoading(true);
    error = null;

    final result = await _repository.otpCode(code);
    result.fold(
          (err) => _setError(err.toString()),
          (success) {
        data = success;
        notifyListeners();
      },
    );

    _setLoading(false);
  }
}
