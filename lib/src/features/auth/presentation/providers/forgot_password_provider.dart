import 'package:flutter/material.dart';
import 'package:movie_moka/src/features/auth/domain/entities/forgot_password.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/forgot_password_repository.dart';
import 'package:movie_moka/src/features/auth/domain/usecases/post_forgot_password.dart';

class ForgotPasswordProvider extends ChangeNotifier {
  final ForgotPasswordRepository repository;

  // initialize Variable
  late final PostForgotPassword postForgotPassword;
  ForgotPasswordEntity forgotPasswordForm = ForgotPasswordEntity();

  ForgotPasswordProvider({required this.repository}) {
    postForgotPassword = PostForgotPassword(repository: repository);
  }

  // register form
  Future<String> submitForgotPassword(ForgotPasswordEntity forgotForm) {
    return postForgotPassword.execute(
      forgotForm: forgotForm,
    );
  }

  void updateForgotPasswordForm(ForgotPasswordEntity forgotForm) {
    forgotPasswordForm = forgotForm;
    notifyListeners();
  }

  void clearForgotPasswordForm() {
    forgotPasswordForm = ForgotPasswordEntity();
    notifyListeners();
  }
}
