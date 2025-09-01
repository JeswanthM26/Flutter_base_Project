import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('te'),
  ];

  static String getLangName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'te':
        return 'తెలుగు';
      default:
        return 'English';
    }
  }
}
