import 'package:movie_moka/src/features/auth/domain/repositories/login.dart';

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<String> postLogin() async {
    final result = await Future.delayed(const Duration(seconds: 3), () {
      return 'Hello World';
    });

    return result;
  }
}
