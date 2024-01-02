import 'package:movie_moka/src/features/auth/domain/entities/forgot_password.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/forgot_password_repository.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  ForgotPasswordRepositoryImpl();

  @override
  Future<String> postForgotPassword({
    required ForgotPasswordEntity forgotForm,
  }) async {
    final result = await Future.delayed(const Duration(seconds: 3), () {
      return 'Hello World';
    });

    return result;
  }
}
