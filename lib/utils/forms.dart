String emailValidation(String value) {
  bool emailValid =
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
  if (!emailValid) {
    return "Enter valid email address";
  } else {
    return null;
  }
}
