mixin Validators {
  String? emailValidator(value) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Enter an email';
    } else if (!regExp.hasMatch(
      value.toString().trim(),
    )) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? phoneValidator(value) {
    const pattern2 = r'^[6-9]\d{9}$';
    final regNum = RegExp(pattern2);
    if (value == "") {
      return '* Please enter a mobile number ';
    } else if (!regNum.hasMatch(value!)) {
      return 'Invalid mobile number';
    } else {
      return null;
    }
  }

  String? validator(value) {
    if (value == "" || value == null) {
      return "Required field*";
    } else {
      return null;
    }
  }

  String? passwordValidator(value) {
    const pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$';
    final regExp = RegExp(pattern);

    if (value!.isEmpty) {
      return 'Enter Password';
    } else if (!regExp.hasMatch(value)) {
      return 'Password must be of length 8\nwith at least 1 uppercase letter\nwith at least 1 lowercase letter\nwith at least 1 number\nand at least 1 special character';
    } else {
      return null;
    }
  }

  String? zipCodeValidator(value) {
    const pattern = r'^[6-9]\d{6}$';
    final regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Area-code is required";
    } else if (!regExp.hasMatch(value!.toString().trim()) && value!.toString().trim().length != 6) {
      return "Enter a valid area code";
    } else {
      return null;
    }
  }
}
