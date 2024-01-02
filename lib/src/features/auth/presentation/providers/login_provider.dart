import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/auth/domain/entities/login.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/login.dart';
import 'package:movie_moka/src/features/auth/domain/usecases/post_login.dart';

class LoginProvider extends ChangeNotifier {
  final LoginRepository repository;

  // initialize Variable
  late final PostLogin postLogin;
  LoginEntity loginForm = LoginEntity();

  LoginProvider({required this.repository}) {
    postLogin = PostLogin(repository: repository);
  }

  // register form
  Future<String> submitLogin(LoginEntity form) {
    return postLogin.execute();
  }

  void updateLoginForm(LoginEntity form) {
    loginForm = form;
    notifyListeners();
  }
}
