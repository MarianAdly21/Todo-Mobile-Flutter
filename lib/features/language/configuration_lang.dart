import 'dart:convert';

import 'package:flutter/services.dart';

class ConfagurationLanguage {
 static  Map localization = {};
  static loadLang(String language) async {
    String translation;
   
    if (language == 'ar') {
      translation = await rootBundle.loadString("assets/translations/ar.json");
    } else {
      translation = await rootBundle.loadString("assets/translations/en.json");
    }
    localization = jsonDecode(translation);
  }
}
