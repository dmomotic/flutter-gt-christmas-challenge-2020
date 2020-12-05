import 'package:flutter/material.dart';
import 'package:flutter_challenge_gt/src/widgets/grid_view.dart';

import 'package:get/get.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../state/theme_controller.dart';
import 'overlay_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  final themeController = Get.put(ThemeController());
  bool showOverlay = false;

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1200), () {
      _chageState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: AnimationLimiter(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: CustomGridView(),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.autorenew),
              onPressed: () {
                themeController.change();
              },
            ),
          ),
        ),
        showOverlay
            ? GestureDetector(
                child: AnimationConfiguration.synchronized(
                  duration: Duration(milliseconds: 1000),
                  child: FadeInAnimation(
                    child: OverlayPage(),
                  ),
                ),
                onTap: _chageState,
              )
            : Container(),
      ],
    );
  }

  _chageState() {
    setState(() {
      showOverlay = !showOverlay;
    });
  }
}
