import 'package:movie_moka/src/features/auth/domain/entities/login_with_email.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/login_with_email_repository.dart';

class PostLoginWithEmail {
  final LoginWithEmailRepository repository;
  PostLoginWithEmail({required this.repository});

  Future<String> execute({required LoginWithEmailEntity loginForm}) {
    return repository.postLoginWithEmail(loginForm: loginForm);
  }
}
