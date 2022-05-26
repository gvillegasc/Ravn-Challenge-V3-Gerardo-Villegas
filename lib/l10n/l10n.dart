import 'package:flutter/widgets.dart';

class L10n {
  static final all = [
    const Locale('es'),
    const Locale('en'),
  ];
}

Locale findLocale(String code) {
  final locale = L10n.all.firstWhere((locale) => locale.languageCode == code);
  return locale;
}
