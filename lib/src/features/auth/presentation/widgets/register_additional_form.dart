import 'package:accordion/accordion_section.dart';
import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_dropdown.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_ink_well.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';

class RegisterAdditionalForm extends StatefulWidget {
  const RegisterAdditionalForm({super.key});

  @override
  State<RegisterAdditionalForm> createState() => _RegisterAdditionalFormState();
}

class _RegisterAdditionalFormState extends State<RegisterAdditionalForm> {
  bool _isAccordionOpen = false;

  List<String> cities = [
    'Medan',
    'Palembang',
    'Pekanbaru',
    'Batam',
    'Serang',
    'Lampung'
  ];

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
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 420,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: MokaTextField(
                label: 'Fullname',
                value: '',
                hintText: 'Please input your fullname',
                onChangeTextForm: (value) {},
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
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                    Border.all(width: 1, color: Colors.black),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.male,
                                    color: Colors.black,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'MALE',
                                        style: TextStyle(
                                          color: Colors.black,
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
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.female,
                                    color: Colors.grey.shade400,
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'FEMALE',
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
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
                value: '',
                hintText: 'Please input your Address',
                onChangeTextForm: (value) {},
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: MokaDropdown<String>(
                label: 'City',
                value: cities.first,
                hintText: 'Please select City',
                onChanged: (value) {},
                items: cities
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: MokaTextField(
                label: 'MOKA MOVIE Number',
                value: '',
                hintText: 'Please input your MOKA MOVIE Card Number',
                onChangeTextForm: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
