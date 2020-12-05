import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool _isDark = false;

  void change() {
    _isDark = !_isDark;
    Get.changeTheme(
      _isDark
          ? ThemeData.dark().copyWith(
              floatingActionButtonTheme:
                  ThemeData.dark().floatingActionButtonTheme.copyWith(
                        backgroundColor: Colors.green[900],
                        foregroundColor: Colors.white,
                      ),
            )
          : ThemeData.light().copyWith(
              floatingActionButtonTheme:
                  ThemeData.light().floatingActionButtonTheme.copyWith(
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                      ),
            ),
    );
  }
}
