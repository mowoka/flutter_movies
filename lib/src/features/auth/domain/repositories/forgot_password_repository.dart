import 'package:movie_moka/src/features/auth/domain/entities/forgot_password.dart';

abstract class ForgotPasswordRepository {
  ForgotPasswordRepository();

  Future<String> postForgotPassword({required ForgotPasswordEntity forgotForm});
}
