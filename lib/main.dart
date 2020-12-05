import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Challenge GT20',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      themeMode: ThemeMode.light,
      home: Center(
        child: AnimatedSplashScreen(
          duration: 3000,
          splash: 'assets/quetzal.png',
          nextScreen: HomePage(),
          splashTransition: SplashTransition.fadeTransition,
          splashIconSize: 250.0,
          animationDuration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
