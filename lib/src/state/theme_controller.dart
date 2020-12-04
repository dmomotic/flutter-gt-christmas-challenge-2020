import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool _isDark = false;

  void change() {
    _isDark = !_isDark;
    Get.changeTheme(_isDark ? ThemeData.dark() : ThemeData.light());
  }
}
