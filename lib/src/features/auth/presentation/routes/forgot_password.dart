import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  static const routeName = 'forgot password';
  static const routePath = '/forgot-password';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                              'Reset Password',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Password recovery link will be sent to your e-email',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 6),
                        child: MokaTextField(
                          label: 'E-mail',
                          value: '',
                          hintText: 'Please input your e-mail address',
                          onChangeTextForm: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
                MokaInkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade700,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Center(
                      child: Text(
                        'RESET PASSWORD',
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
        ),
      ),
    );
  }
}
