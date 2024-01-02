import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_dropdown.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';
import 'package:movie_moka/src/features/auth/domain/entities/register.dart';
import 'package:movie_moka/src/features/auth/presentation/providers/register_provider.dart';
import 'package:provider/provider.dart';

class RegisterAdditionalForm extends StatefulWidget {
  const RegisterAdditionalForm({
    super.key,
  });

  @override
  State<RegisterAdditionalForm> createState() => _RegisterAdditionalFormState();
}

class _RegisterAdditionalFormState extends State<RegisterAdditionalForm> {
  bool _isAccordionOpen = false;

  @override
  Widget build(BuildContext context) {
    return AccordionSection(
      isOpen: _isAccordionOpen,
      onCloseSection: () {
        setState(() {
          _isAccordionOpen = false;
        });
      },
      onOpenSection: () {
        setState(() {
          _isAccordionOpen = true;
        });
      },
      headerBackgroundColor: Colors.white,
      headerBackgroundColorOpened: Colors.white,
      headerBorderRadius: 0,
      headerBorderWidth: 0,
      headerPadding: const EdgeInsets.only(
        left: 14,
        right: 10,
        top: 15,
        bottom: 10,
      ),
      headerBorderColor: Colors.black,
      contentBorderColor: Colors.white,
      contentVerticalPadding: 0,
      contentHorizontalPadding: 0,
      contentBorderRadius: 0,
      header: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ADDITIONAL QUESTION',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade500,
                ),
              ),
              Icon(
                _isAccordionOpen
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_right,
              )
            ],
          ),
          const Divider(),
        ],
      ),
      content: Consumer<RegisterProvider>(
        builder: (context, notifier, child) {
          final registerForm = notifier.registerForm;
          final additionalForm = notifier.registerForm.additionalData;
          final isMale = additionalForm.gender == Gender.male;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 420,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MokaTextField(
                    label: 'Fullname',
                    value: additionalForm.fullname,
                    hintText: 'Please input your fullname',
                    onChangeTextForm: (value) {
                      additionalForm.fullname = value;
                      notifier.updateRegisterForm(registerForm);
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: MokaInkWell(
                                onTap: () {
                                  additionalForm.gender = Gender.male;
                                  notifier.updateRegisterForm(registerForm);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      width: 1,
                                      color: isMale
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.male,
                                        color: isMale
                                            ? Colors.black
                                            : Colors.grey.shade400,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'MALE',
                                            style: TextStyle(
                                              color: isMale
                                                  ? Colors.black
                                                  : Colors.grey.shade400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: MokaInkWell(
                                onTap: () {
                                  additionalForm.gender = Gender.female;
                                  notifier.updateRegisterForm(registerForm);
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      width: 1,
                                      color: !isMale
                                          ? Colors.black
                                          : Colors.grey.shade400,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.female,
                                        color: !isMale
                                            ? Colors.black
                                            : Colors.grey.shade400,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Text(
                                            'FEMALE',
                                            style: TextStyle(
                                              color: !isMale
                                                  ? Colors.black
                                                  : Colors.grey.shade400,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MokaTextField(
                    label: 'Address',
                    value: additionalForm.address,
                    hintText: 'Please input your Address',
                    onChangeTextForm: (value) {
                      additionalForm.address = value;
                      notifier.updateRegisterForm(registerForm);
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MokaDropdown<City>(
                    label: 'City',
                    value: additionalForm.city,
                    hintText: 'Please select City',
                    onChanged: (value) {
                      additionalForm.city = value;
                      notifier.updateRegisterForm(registerForm);
                    },
                    items: City.values
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(e.label),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MokaTextField(
                    label: 'MOKA MOVIE Number',
                    value: additionalForm.mokaMovieNumber,
                    hintText: 'Please input your MOKA MOVIE Card Number',
                    onChangeTextForm: (value) {
                      additionalForm.mokaMovieNumber = value;
                      notifier.updateRegisterForm(registerForm);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
