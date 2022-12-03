// Packages
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  void changeLanguage(String langCode) {
    final Locale locale = Locale(langCode);

    Get.updateLocale(locale);
  }
}
