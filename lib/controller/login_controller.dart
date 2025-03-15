import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  // State Variables
  bool obscureText = true;
  bool obscureText2 = true;
  bool isLoginMode = true;
  bool isLoading = false;
  bool isRememberMeChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void initializeCredentials(String? email, String? password) {
    emailController.text = email ?? '';
    passwordController.text = password ?? '';
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    confirmPasswordController.dispose();
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
  };

  // Static compiled regular expressions
  static final _emailRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final _phoneRegExp = RegExp(r'^(079|077|078)[0-9]{7}$');
  static final _passwordRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
  );

  // Toggle Password Visibility
  void togglePasswordVisibility() {
    obscureText = !obscureText;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    obscureText2 = !obscureText2;
    notifyListeners();
  }

  // Validate a Specific Field
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
        _validateConfirmPassword(value, errors['password']);
        break;
      case 'name':
        _validateName(value);
        break;
      default:
        errors[field] = null;
    }

    if (errors[field] != oldError) {
      notifyListeners(); // Notify only if there's a change
    }
  }

  void _validateEmail(String? email) {
    final newError = email == null || !_emailRegExp.hasMatch(email)
        ? "Please enter a valid email address."
        : null;
    if (errors['email'] != newError) {
      errors['email'] = newError;
      notifyListeners(); // Notify only if there's a change
    }
  }

  // Validate All Fields Based on Mode
  void validateForm({
    required BuildContext context,
    required String email,
    required String password,
    String? confirmPassword,
    String? phone,
    String? name,
  }) {
    final oldErrors = Map<String, String?>.from(errors);

    _validateEmail(email);
    _validatePassword(password);

    if (!isLoginMode) {
      _validateConfirmPassword(confirmPassword, password);
      _validatePhone(phone);
      _validateName(name);
    }

    if (!_mapsEqual(oldErrors, errors)) {
      notifyListeners();
    }
  }

  // Check if the Form is Valid
  bool isFormValid() {
    return !errors.values.any((error) => error != null);
  }

  void _validatePhone(String? phoneNo) {
    final newError = phoneNo == null || !_phoneRegExp.hasMatch(phoneNo)
        ? "Please enter a valid phone number."
        : null;
    if (errors['phone'] != newError) {
      errors['phone'] = newError;
    }
  }

  void _validatePassword(String? password) {
    final newError = password == null || !_passwordRegExp.hasMatch(password)
        ? "Password must be at least 8 characters long and include uppercase, lowercase, numbers, and special characters."
        : null;
    if (errors['password'] != newError) {
      errors['password'] = newError;
    }
  }

  void _validateConfirmPassword(
      String? confirmPassword,
      String? password,
      ) {
    final newError = confirmPassword != password
        ? "Passwords do not match."
        : null;
    if (errors['confirmPassword'] != newError) {
      errors['confirmPassword'] = newError;
    }
  }

  void _validateName(String? name) {
    final newError = name == null || name.isEmpty
        ? "Please enter your name."
        : null;
    if (errors['name'] != newError) {
      errors['name'] = newError;
    }
  }

  // Switch Between Login and Signup Modes
  void setLoginMode(bool isLogin) {
    isLoginMode = isLogin;
    errors.clear();
    notifyListeners();
  }

  // Helper method to compare maps
  bool _mapsEqual(Map<String, String?> a, Map<String, String?> b) {
    if (a.length != b.length) return false;
    for (final key in a.keys) {
      if (a[key] != b[key]) return false;
    }
    return true;
  }
}