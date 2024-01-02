bool validateEmail(String value) {
  return RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(value);
}

bool validateMobilePhone(String value) {
  return RegExp(
    r'^0\d{9,12}$',
  ).hasMatch(value);
}
