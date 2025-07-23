String? validateEmail(String? value) {
  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePhone(String? value) {
  String pattern = r'^\+923\d{9}$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter valid Pakistani number (e.g. +923001234567)';
  }
  return null;
}


String? validatePassword(String? value) {
  String pattern = r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[^A-Za-z\d])[A-Za-z\d\W]{6,}$';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Min 6 chars, include 1 letter, 1 number, 1 symbol';
  }
  return null;
}
