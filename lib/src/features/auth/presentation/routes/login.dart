import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/features/auth/presentation/widgets/login_content.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  static const routeName = 'login';
  static const routePath = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const SingleChildScrollView(
            child: LoginContent(),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: SizedBox(
              height: 40,
              width: 40,
              child: MokaInkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
