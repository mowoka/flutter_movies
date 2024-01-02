import 'package:flutter/foundation.dart';
import 'package:movie_moka/src/features/auth/domain/entities/register.dart';
import 'package:movie_moka/src/features/auth/domain/repositories/register_repository.dart';
import 'package:movie_moka/src/features/auth/domain/usecases/post_register.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterRepository repository;

  // initialize Variable
  late final PostRegister postRegister;
  RegisterEntity registerForm = RegisterEntity();

  RegisterProvider({required this.repository}) {
    postRegister = PostRegister(repository: repository);
  }

  // register form
  Future<String> submitRegister(RegisterEntity registerForm) {
    return postRegister.execute(registerForm);
  }

  void updateRegisterForm(RegisterEntity form) {
    registerForm = form;
    notifyListeners();
  }

  void clearRegisterForm(RegisterEntity form) {
    registerForm = RegisterEntity();
    notifyListeners();
  }
}
