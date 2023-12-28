import 'package:movie_moka/src/features/auth/domain/entities/login_with_email.dart';

abstract class LoginWithEmailRepository {
  LoginWithEmailRepository();

  Future<String> postLoginWithEmail({required LoginWithEmailEntity loginForm});
}
