import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_date_picker.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_dropdown.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';

class RegisterPrimaryForm extends StatefulWidget {
  const RegisterPrimaryForm({super.key});

  @override
  State<RegisterPrimaryForm> createState() => _RegisterPrimaryFormState();
}

class _RegisterPrimaryFormState extends State<RegisterPrimaryForm> {
  List<String> favoriteMovies = [
    'Focal Point',
    'Raya Padang',
    'Transmart Pekanbaru',
    'Studio Pekanbaru',
    'Holiday Pekanbaru',
    'Grand Battam Malll',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaTextField(
              label: 'E-mail',
              isMandatory: true,
              value: '',
              hintText: 'ex: johndoe@mail.com',
              onChangeTextForm: (value) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaTextField(
              label: 'Mobile Number',
              isMandatory: true,
              value: '',
              hintText: 'Input your mobile number',
              onChangeTextForm: (value) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: const MokaDatePicker(
              label: 'Birthdate',
              isMandatory: true,
              hintText: 'Please Input your birthdate',
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaTextField(
              label: 'Username',
              isMandatory: true,
              value: '',
              hintText: 'Please input your username',
              onChangeTextForm: (value) {},
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaDropdown<String>(
              label: 'Favorite Cinema',
              isMandatory: true,
              value: favoriteMovies.first,
              hintText: 'Select Favorite Cinema',
              onChanged: (value) {},
              items: favoriteMovies
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
