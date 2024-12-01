import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier {
  static Locale locale = const Locale("en");

  switchLanguage(Locale newLocale) {
    if (newLocale == locale) return;
    locale = newLocale;
    notifyListeners();
    print("locale changed to ${locale.toString()}");
  }
}
