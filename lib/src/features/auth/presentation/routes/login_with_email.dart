import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';
import 'package:movie_moka/src/core/utils/validate.dart';
import 'package:movie_moka/src/features/auth/domain/entities/login_with_email.dart';
import 'package:movie_moka/src/features/auth/presentation/providers/login_with_email_provider.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/forgot_password.dart';
import 'package:provider/provider.dart';

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  static const routeName = 'login with email';
  static const routePath = 'login-with-email';

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Consumer<LoginWithEmailProvider>(
          builder: (context, notifier, child) {
            return LoginWithEmailContent(
              loginWithEmailForm: notifier.loginWithEmailForm,
              onChange: (loginWithEmailForm) {
                notifier.updateLoginForm(loginWithEmailForm);
              },
              onSubmit: () async {
                final form = notifier.loginWithEmailForm;
                await notifier.submitLoginWithEmailForm(form);
              },
            );
          },
        ),
      ),
    );
  }
}

class LoginWithEmailContent extends StatelessWidget {
  const LoginWithEmailContent({
    super.key,
    required this.loginWithEmailForm,
    required this.onChange,
    required this.onSubmit,
  });

  final LoginWithEmailEntity loginWithEmailForm;
  final Function(LoginWithEmailEntity loginWithEmailForm) onChange;
  final Future<void> Function() onSubmit;

  @override
  Widget build(BuildContext context) {
    final email = loginWithEmailForm.email;
    final password = loginWithEmailForm.password;

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height - 40,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MokaInkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 6,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Login with E-mail',
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Pelase enter your email and password to log into your account',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: MokaTextField(
                      label: 'E-mail',
                      value: email,
                      hintText: 'ex: johndoe@gmail.com',
                      onChangeTextForm: (value) {
                        loginWithEmailForm.email = value;
                        onChange(loginWithEmailForm);
                      },
                      validator: (value) {
                        if (value.isEmpty) return null;
                        final valid = validateEmail(value);
                        if (valid) return null;
                        return 'Email tidak valid';
                      },
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                    child: MokaTextField(
                      label: 'Password',
                      value: password,
                      hintText: 'Please input your password',
                      type: Type.password,
                      onChangeTextForm: (value) {
                        loginWithEmailForm.password = value;
                        onChange(loginWithEmailForm);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: MokaInkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          ForgotPassword.routeName,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        child: const Text(
                          'FORGOT PASSWORD?',
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            MokaInkWell(
              onTap: onSubmit,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.shade700,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Center(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
