import 'package:movie_moka/src/features/auth/domain/entities/register.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/register_repository.dart';

class PostRegister {
  final RegisterRepository repository;

  PostRegister({required this.repository});

  Future<String> execute(RegisterEntity registerForm) {
    return repository.postRegister(registerForm);
  }
}
