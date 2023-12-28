import 'package:movie_moka/src/features/auth/domain/entities/forgot_password.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/forgot_password_repository.dart';

class PostForgotPassword {
  final ForgotPasswordRepository repository;

  PostForgotPassword({required this.repository});

  Future<String> execute({required ForgotPasswordEntity forgotForm}) {
    return repository.postForgotPassword(
      forgotForm: forgotForm,
    );
  }
}
