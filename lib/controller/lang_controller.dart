import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangController extends ChangeNotifier {
  static const String defaultLangCode = "en";

  late SharedPreferences prefs;
  Locale locale = Locale(defaultLangCode);
  String currentLangCode = defaultLangCode;



  LangController() {
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    await _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    String langCode = prefs.getString("lang") ?? defaultLangCode;
    _updateLocale(langCode);
  }

  void _updateLocale(String langCode) {
    locale = Locale(langCode);
    currentLangCode = langCode;
    notifyListeners();
  }

  Future<void> changeLang({required String langCode}) async {
    try {
      await prefs.setString("lang", langCode);
      _updateLocale(langCode);
    } catch (e) {
      print("Failed to save language preference: $e");
    }
  }

  Future<Locale> getLocale() async {
    if (prefs == null) {
      await initSharedPreferences();
    }
    return locale;
  }
}