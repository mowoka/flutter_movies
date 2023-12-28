import 'package:movie_moka/src/features/auth/domain/entities/forgot_password.dart';

abstract class ForgotPasswordRepository {
  late Future<String> Function() accessTokenGetter;

  ForgotPasswordRepository({required this.accessTokenGetter});

  Future<String> postForgotPassword({required ForgotPasswordEntity forgotForm});
}
