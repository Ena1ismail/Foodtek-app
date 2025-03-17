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

  String _selectedCountryCode = 'IN'; // Default to India
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

  void setRememberMe(bool value) {
    isRememberMeChecked = value;
    notifyListeners();
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
  static final _phoneRegExp = RegExp(r'^(079|077|078)[0-9]{7}$');
  static final _passwordRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
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
        _validateEmail(value);
        break;
      case 'phone':
        _validatePhone(value);
        break;
      case 'password':
        _validatePassword(value);
        break;
      case 'confirmPassword':
        _validateConfirmPassword(value, errors['password'], context);
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

  void _validateEmail(String? email) {
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
    String? confirmPassword,
    String? phone,
    String? name,
    String? birth,
  }) {
    final oldErrors = Map<String, String?>.from(errors);

    _validateEmail(email);
    _validatePassword(password);
    _validateConfirmPassword(confirmPassword, password, context);
    _validatePhone(phone);
    _validateName(name);
    _validateBirth(birth);

    if (!_mapsEqual(oldErrors, errors)) {
      notifyListeners();
    }
  }

  bool isFormValid() {
    return !errors.values.any((error) => error != null);
  }

  void _validatePassword(String? password) {
    final newError =
        password == null || password.isEmpty
            ? "Password can't be empty."
            : !_passwordRegExp.hasMatch(password)
            ? "Please enter a strong password."
            : null;
    if (errors['password'] != newError) {
      errors['password'] = newError;
    }
  }


  void _validateConfirmPassword(
      String? confirmPassword,
      String? password,
      BuildContext context,
      ) {
    final newError = confirmPassword != password
        ? "Passwords do not match"
        : null;
    if (errors['confirmPassword'] != newError) {
      errors['confirmPassword'] = newError;
    }
  }

  void _validatePhone(String? phoneNo) {
    final newError =
        phoneNo == null || phoneNo.isEmpty || !_phoneRegExp.hasMatch(phoneNo)
            ? "Please enter a valid phone number."
            : null;
    if (errors['phone'] != newError) {
      errors['phone'] = newError;
    }
  }

  void _validateName(String? name) {
    final newError =
        name == null || name.isEmpty ? "Please enter your name." : null;
    if (errors['name'] != newError) {
      errors['name'] = newError;
    }
  }

  void _validateBirth(String? birth) {
    final newError =
        birth == null || birth.isEmpty
            ? "Please enter your date of birth."
            : null;
    if (errors['birth'] != newError) {
      errors['birth'] = newError;
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
}
