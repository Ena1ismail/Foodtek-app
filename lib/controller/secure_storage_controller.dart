import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageController extends ChangeNotifier{
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Save credentials securely
  Future<void> saveCredentials(String email, String password) async {
    await _secureStorage.write(key: 'email', value: email);
    await _secureStorage.write(key: 'password', value: password);
  }

  // Load saved credentials
  Future<Map<String, String>> loadCredentials() async {
    final email = await _secureStorage.read(key: 'email');
    final password = await _secureStorage.read(key: 'password');

    return {
      'email': email ?? '',
      'password': password ?? '',
    };
  }

  // Clear saved credentials
  Future<void> clearCredentials() async {
    await _secureStorage.delete(key: 'email');
    await _secureStorage.delete(key: 'password');
  }
}