import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';
import 'package:movie_moka/src/core/utils/moka_toast.dart';
import 'package:movie_moka/src/core/utils/validate.dart';
import 'package:movie_moka/src/features/auth/presentation/providers/login_provider.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/login_with_email.dart';
import 'package:movie_moka/src/features/auth/presentation/routes/register.dart';
import 'package:provider/provider.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final mobilePhoneController = TextEditingController();
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://public.urbanasia.com/images/post/2022/10/26/1666786292-bioskop-cgv.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          child: Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              padding: const EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height - 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.elliptical(200, 20)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 40,
                    ),
                    child: Text(
                      'Login to enjoy all the benefit of your Moka Movie membership!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Consumer<LoginProvider>(
                    builder: (context, notifier, child) {
                      final loginForm = notifier.loginForm;
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        width: double.infinity,
                        child: MokaTextField(
                          label: 'Mobile Number',
                          hintText: 'Input your mobile number',
                          keyboardType: TextInputType.phone,
                          value: notifier.loginForm.mobileNumber,
                          textController: mobilePhoneController,
                          onChangeTextForm: (value) {
                            if (value.length == 1 && value != '0') {
                              notifier.loginForm.mobileNumber = '0';
                              notifier.updateLoginForm(loginForm);
                            } else {
                              notifier.loginForm.mobileNumber = value;
                              notifier.updateLoginForm(loginForm);
                            }
                          },
                          validator: (value) {
                            if (value.isEmpty) return null;
                            if (!validateMobilePhone(value)) {
                              return 'Nomor tidak valid';
                            }
                            return null;
                          },
                        ),
                      );
                    },
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Consumer<LoginProvider>(
                            builder: (context, notifier, child) {
                              final isValid = validateMobilePhone(
                                notifier.loginForm.mobileNumber,
                              );
                              return MokaInkWell(
                                onTap: () async {
                                  if (!isValid) {
                                    MokaToast.showToast(
                                      fToast: fToast,
                                      message: 'Nomor Telepon Tidak Valid',
                                      messageStatus: MessageStatus.error,
                                    );
                                    return;
                                  }
                                  final provider = Provider.of<LoginProvider>(
                                    context,
                                    listen: false,
                                  );
                                  final loginForm = provider.loginForm;
                                  await provider.submitLogin(loginForm);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: isValid
                                        ? Colors.grey.shade700
                                        : Colors.grey.shade500,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'CONTINUE',
                                      style: TextStyle(
                                        color: isValid
                                            ? Colors.white
                                            : Colors.grey.shade400,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        MokaInkWell(
                          onTap: () {},
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.fingerprint,
                                color: Colors.red,
                                size: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 40,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                            height: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            'OR',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 1,
                            height: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.symmetric(
                        vertical: 10, horizontal: 20),
                    width: double.infinity,
                    child: MokaInkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 8,
                          bottom: 8,
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade800,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 25,
                              child: SvgPicture.asset(
                                'assets/svg/google.svg',
                                semanticsLabel: 'Google Logo',
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'CONTINUE WITH GOOGLE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: MokaInkWell(
                      onTap: () {
                        GoRouter.of(context).pushNamed(
                          LoginWithEmail.routeName,
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                          left: 15,
                          top: 8,
                          bottom: 8,
                        ),
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.8, color: Colors.black),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 25,
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.black54,
                                size: 25,
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'CONTINUE WITH EMAIL',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 25),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet?",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(width: 4),
                          MokaInkWell(
                            onTap: () {
                              GoRouter.of(context).pushNamed(
                                Register.routeName,
                              );
                            },
                            child: const Text(
                              'REGISTER NOW!',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
