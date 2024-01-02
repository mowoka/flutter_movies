import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/auth/domain/entities/login_with_email.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/login_with_email_repository.dart';
import 'package:movie_moka/src/features/auth/domain/usecases/post_login_with_email.dart';

class LoginWithEmailProvider extends ChangeNotifier {
  final LoginWithEmailRepository repository;

  // initialize variable
  late final PostLoginWithEmail postLoginWithEmail;
  LoginWithEmailEntity loginWithEmailForm = LoginWithEmailEntity();

  LoginWithEmailProvider({required this.repository}) {
    postLoginWithEmail = PostLoginWithEmail(repository: repository);
  }

  // register function
  Future<String> submitLoginWithEmailForm(LoginWithEmailEntity loginForm) {
    return postLoginWithEmail.execute(loginForm: loginForm);
  }

  void updateLoginForm(LoginWithEmailEntity loginForm) {
    loginWithEmailForm = loginForm;
    notifyListeners();
  }

  void clearLoginForm() {
    loginWithEmailForm = LoginWithEmailEntity();
    notifyListeners();
  }
}
