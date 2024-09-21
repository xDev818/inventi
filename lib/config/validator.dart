class Validator {
  static String? validateEmail({required String email}) {
    RegExp regEx = RegExp(
        r'^(?!\.)("[\w-\s]+")?([\w-]+(?:\.[\w-]+)*)@((\[[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\.[\d]{1,3}\])|(([\w-]+\.)+[a-zA-Z]{2,}))$');

    if (email.isEmpty) {
      return 'Must Provide valid email';
    } else if (!regEx.hasMatch(email)) {
      return 'Invalid Email Format';
    }
    return null;
  }

  static String? validateName({required String name}) {
    RegExp regEx =
        RegExp(r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$");

    if (name.isEmpty) {
      return 'Must Provide Name';
    } else if (!regEx.hasMatch(name)) {
      return 'Invalid Name format';
    }
    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password field is required';
    } else if (password.length < 8) {
      return 'Password must have 8 Characters';
    }
    return null;
  }
}
