import 'package:flutter/material.dart';
import '../../../data/models/home/login_model.dart';
import '../../authentication/repostory/authentication_repository.dart';

class LoginViewModel extends ChangeNotifier{
  final LoginRepostory _repostory = LoginRepostory();


  bool  isLoading = false;
  String?  error;
  LoginModel?  user;

  Future<void> login(String login, String password) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try{
      user = await _repostory.loginUser(login,password);
    }catch(e){
      error = e.toString();
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }

}