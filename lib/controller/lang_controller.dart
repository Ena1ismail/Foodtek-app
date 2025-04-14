import 'package:flutter/widgets.dart';

class LangController extends ChangeNotifier {
  static const String _defaultLangCode = "en";

  Locale locale = Locale(_defaultLangCode);
  String currentLangCode = _defaultLangCode;


  void _updateLocale(String langCode) {
    locale = Locale(langCode);
    currentLangCode = langCode;
    notifyListeners();
  }

  void changeLang({required String langCode}) {
    _updateLocale(langCode);
  }
}