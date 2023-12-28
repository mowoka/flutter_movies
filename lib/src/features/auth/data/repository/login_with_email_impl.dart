import 'package:movie_moka/src/features/auth/domain/entities/login_with_email.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/login_with_email_repository.dart';

class LoginWithEmailRepositoryImpl implements LoginWithEmailRepository {
  LoginWithEmailRepositoryImpl();

  @override
  Future<String> postLoginWithEmail({
    required LoginWithEmailEntity loginForm,
  }) async {
    final p = loginForm;
    final result = await Future.delayed(const Duration(seconds: 3), () {
      return 'Hello World';
    });

    return result;
  }
}
