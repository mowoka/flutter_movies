import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/utils/moka_toast.dart';
import 'package:movie_moka/src/core/utils/validate.dart';
import 'package:movie_moka/src/features/auth/domain/entities/register.dart';
import 'package:movie_moka/src/features/auth/presentation/providers/register_provider.dart';
import 'package:movie_moka/src/features/auth/presentation/widgets/register_additional_form.dart';
import 'package:movie_moka/src/features/auth/presentation/widgets/register_primary_form.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static const routeName = 'register';
  static const routePath = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: RegisterContent(),
    );
  }
}

class RegisterContent extends StatefulWidget {
  const RegisterContent({
    super.key,
  });

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  late FToast fToast;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MokaInkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const HeadInformation(),
                    Consumer<RegisterProvider>(
                      builder: (context, notifier, child) {
                        return RegisterPrimaryForm(
                          register: notifier.registerForm,
                          onChange: (entity) {
                            notifier.updateRegisterForm(entity);
                          },
                        );
                      },
                    ),
                    Divider(
                      thickness: 4,
                      color: Colors.grey.shade300,
                    ),
                    const RegisterAdditionalForm(),
                    const TermsCondition()
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
            width: double.infinity,
            child: MokaInkWell(
              onTap: () async {
                final provider = Provider.of<RegisterProvider>(
                  context,
                  listen: false,
                );
                final validRes =
                    validateForm(provider.registerForm.primaryData);

                if (validRes != null) {
                  MokaToast.showToast(
                    fToast: fToast,
                    message: validRes,
                    messageStatus: MessageStatus.error,
                  );
                  return;
                }

                await provider.submitRegister(
                  provider.registerForm,
                );
              },
              child: Container(
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
            ),
          ),
        ],
      ),
    );
  }

  String? validateForm(RegisterPrimaryData registerPrimaryForm) {
    if (registerPrimaryForm.email.isEmpty) {
      return 'Mohon mengisi field Email';
    }

    if (!validateEmail(registerPrimaryForm.email)) {
      return 'Email tidak valid';
    }

    if (registerPrimaryForm.mobileNumber.isEmpty) {
      return 'Mohon mengisi field Mobile number';
    }

    if (registerPrimaryForm.username.isEmpty) {
      return 'Mohon mengisi field username';
    }

    return null;
  }
}

class TermsCondition extends StatelessWidget {
  const TermsCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: RichText(
              text: TextSpan(
                text: 'By registering, you understand MOKA MOVIE membership',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade400,
                ),
                children: [
                  const TextSpan(
                    text: ' TERMS & CONDITIONS ',
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.red,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: 'and agree to recive information from MOKA MOVIE.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HeadInformation extends StatelessWidget {
  const HeadInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Complete Data First!',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Welcome to MOKA MOVIE! Please tell us a little bit about yourself.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }
}
