import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool obscureText = true;
  bool obscureText2 = true;
  bool isLoginMode = true;
  bool isLoading = false;
  bool isRememberMeChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String _selectedCountryCode = 'JO';
  String get selectedCountryCode => _selectedCountryCode;

  set selectedCountryCode(String value) {
    _selectedCountryCode = value;
    notifyListeners();
  }

  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    isRememberMeChecked = value;
    notifyListeners();
  }


  void initializeCredentials(String? email, String? password) {
    emailController.text = email ?? '';
    passwordController.text = password ?? '';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    birthController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  final Map<String, String?> errors = {
    'email': null,
    'phone': null,
    'password': null,
    'confirmPassword': null,
    'name': null,
    'birth': null,
  };

  static final _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final _passwordRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
  );

  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureText2 = !obscureText2;
    notifyListeners();
  }

  void validateField({
    required BuildContext context,
    required String field,
    required String? value,
  }) {
    final oldError = errors[field];

    switch (field) {
      case 'email':
        validateEmail(value);
        break;
      case 'phone':
        validatePhone(value);
        break;
      case 'password':
        validatePassword(value);
        break;
      case 'confirmPassword':
        validateConfirmPassword(value, errors['password'], context);
        break;
      case 'name':
        _validateName(value);
        break;
      case 'birth':
        _validateBirth(value);
        break;
      default:
        errors[field] = null;
    }

    if (errors[field] != oldError) {
      notifyListeners();
    }
  }

  void validateEmail(String? email) {
    final newError =
        email == null || email.isEmpty
            ? "Email can't be empty."
            : !_emailRegExp.hasMatch(email)
            ? "Please enter a valid email address."
            : null;

    if (errors['email'] != newError) {
      errors['email'] = newError;
      notifyListeners();
    }
  }

  void validateForm({
    required BuildContext context,
    String? email,
    String? password,
    String? phone,
    String? name,
    String? birth,
  }) {
    clearErrors();
    final oldErrors = Map<String, String?>.from(errors);

    validateEmail(email);
    validatePassword(password);
    validatePhone(phone);
    _validateName(name);
    _validateBirth(birth);

    print("Old Errors: $oldErrors");
    print("New Errors: $errors");

    if (!_mapsEqual(oldErrors, errors)) {
      notifyListeners();
    }
  }

  bool isFormValid() {
    return !errors.values.any((error) => error != null);
  }

  void validatePassword(String? password) {
    password = password?.trim();
    final newError =
    password == null || password.isEmpty
        ? "Password can't be empty."
        : !_passwordRegExp.hasMatch(password)
        ? "Please enter a strong password."
        : null;
    if (errors['password'] != newError) {
      errors['password'] = newError;
      notifyListeners();
    }
  }


  void validateConfirmPassword(
      String? confirmPassword,
      String? password,
      BuildContext context,
      ) {
    confirmPassword = confirmPassword?.trim();
    password = password?.trim();

    final newError = confirmPassword != password
        ? "Passwords do not match"
        : null;
    if (errors['confirmPassword'] != newError) {
      errors['confirmPassword'] = newError;
      notifyListeners();
    }
  }

  void validatePhone(String? phoneNo) {
    String? trimmedPhone = phoneNo?.replaceFirst(RegExp(r'^0+'), '');

    final newError = (trimmedPhone == null || trimmedPhone.isEmpty)
        ? "Please enter a valid phone number."
        : null;

    if (errors['phone'] != newError) {
      errors['phone'] = newError;
      notifyListeners();
    }
  }

  void _validateName(String? name) {
    final newError = (name == null || name.isEmpty)
        ? "Please enter your name."
        : name.trim().split(' ').length < 2
        ? "Please enter both first and last name."
        : null;

    if (errors['name'] != newError) {
      errors['name'] = newError;
      notifyListeners();
    }
  }

  void _validateBirth(String? birth) {
    final newError =
    birth == null || birth.isEmpty ? "Please enter your date of birth." : null;
    if (errors['birth'] != newError) {
      errors['birth'] = newError;
      notifyListeners();
    }
  }

  bool _mapsEqual(Map<String, String?> a, Map<String, String?> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (a[key] != b[key]) return false;
    }
    return true;
  }

  void clearErrors() {
    errors.forEach((key, value) {
      errors[key] = null;
    });
    notifyListeners();
  }



  DateTime getValidInitialDate() {
    DateTime now = DateTime.now();
    int maximumYear = now.year - 16;

    if (now.year > maximumYear) {
      return DateTime(maximumYear, now.month, now.day);
    }

    return now;
  }
}
