import 'package:movie_moka/src/features/auth/domain/repositories/login.dart';

class PostLogin {
  final LoginRepository repository;

  PostLogin({required this.repository});

  Future<String> execute() {
    return repository.postLogin();
  }
}
