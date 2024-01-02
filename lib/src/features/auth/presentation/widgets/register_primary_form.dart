import 'package:flutter/material.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_date_picker.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_dropdown.dart';
import 'package:movie_moka/src/core/presentation/widgets/moka_text_field.dart';
import 'package:movie_moka/src/core/utils/validate.dart';
import 'package:movie_moka/src/features/auth/domain/entities/register.dart';

class RegisterPrimaryForm extends StatefulWidget {
  const RegisterPrimaryForm({
    super.key,
    required this.register,
    required this.onChange,
  });

  final RegisterEntity register;
  final Function(RegisterEntity entity) onChange;

  @override
  State<RegisterPrimaryForm> createState() => _RegisterPrimaryFormState();
}

class _RegisterPrimaryFormState extends State<RegisterPrimaryForm> {
  @override
  Widget build(BuildContext context) {
    final registerPrimaryForm = widget.register.primaryData;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaTextField(
              label: 'E-mail',
              isMandatory: true,
              value: registerPrimaryForm.email,
              hintText: 'ex: johndoe@mail.com',
              onChangeTextForm: (value) {
                registerPrimaryForm.email = value;
                widget.onChange(widget.register);
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
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaTextField(
              label: 'Mobile Number',
              isMandatory: true,
              value: registerPrimaryForm.mobileNumber,
              hintText: 'Input your mobile number',
              onChangeTextForm: (value) {
                registerPrimaryForm.mobileNumber = value;
                widget.onChange(widget.register);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaDatePicker(
              label: 'Birthdate',
              value: registerPrimaryForm.birtdate,
              isMandatory: true,
              hintText: 'Please Input your birthdate',
              onChange: (value) {
                registerPrimaryForm.birtdate = value;
                widget.onChange(widget.register);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaTextField(
              label: 'Username',
              isMandatory: true,
              value: registerPrimaryForm.username,
              hintText: 'Please input your username',
              onChangeTextForm: (value) {
                registerPrimaryForm.username = value;
                widget.onChange(widget.register);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: MokaDropdown<FavoriteMovie>(
              label: 'Favorite Cinema',
              isMandatory: true,
              value: registerPrimaryForm.favoriteCinema,
              hintText: 'Select Favorite Cinema',
              onChanged: (value) {
                registerPrimaryForm.favoriteCinema = value;
                widget.onChange(widget.register);
              },
              items: FavoriteMovie.values
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.label),
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
