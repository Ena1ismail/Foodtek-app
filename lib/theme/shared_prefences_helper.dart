import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final SharedPreferencesHelper instance = SharedPreferencesHelper._internal();
  SharedPreferences? _prefs;

  SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Remove item from storage
  Future<void> remove({required String key}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.remove(key);
  }

  // Save theme preference
  Future<void> saveTheme(bool isDarkMode) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setBool('isDarkMode', isDarkMode);
  }

  // Get saved theme preference
  Future<bool> getSavedTheme() async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getBool('isDarkMode') ?? false; // Default to false if not found
  }

  // Generic save methods
  Future<void> savePrefString({required String key, required String value}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setString(key, value);
  }

  Future<void> savePrefInt({required String key, required int value}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setInt(key, value);
  }

  Future<void> savePrefBool({required String key, required bool value}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setBool(key, value);
  }

  Future<void> savePrefDouble({required String key, required double value}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setDouble(key, value);
  }

  Future<void> savePrefStringList({required String key, required List<String> value}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    await _prefs!.setStringList(key, value);
  }

  // Generic get methods
  Future<String> getPrefString({required String key, required String defaultValue}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getString(key) ?? defaultValue;
  }

  Future<int> getPrefInt({required String key, required int defaultValue}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getInt(key) ?? defaultValue;
  }

  Future<bool> getPrefBool({required String key, required bool defaultValue}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getBool(key) ?? defaultValue;
  }

  Future<double> getPrefDouble({required String key, required double defaultValue}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getDouble(key) ?? defaultValue;
  }

  Future<List<String>> getPrefStringList({required String key, required List<String> defaultValue}) async {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs!.getStringList(key) ?? defaultValue;
  }
}