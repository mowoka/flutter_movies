import 'package:movie_moka/src/features/auth/domain/entities/register.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  @override
  Future<String> postRegister(RegisterEntity registerForm) async {
    final result = await Future.delayed(const Duration(seconds: 3), () {
      return 'Hello World';
    });

    return result;
  }
}
