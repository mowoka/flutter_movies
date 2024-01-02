import 'package:movie_moka/src/features/auth/domain/entities/register.dart';

abstract class RegisterRepository {
  RegisterRepository();

  Future<String> postRegister(RegisterEntity registerForm);
}
