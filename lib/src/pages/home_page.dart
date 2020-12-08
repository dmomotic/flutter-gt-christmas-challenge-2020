// import 'package:flare_flutter/flare_actor.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'gift_page.dart';
import 'overlay_page.dart';
import '../widgets/grid_view.dart';
import '../widgets/floating_menu.dart';
import '../state/theme_controller.dart';
import '../state/gift_page_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AfterLayoutMixin<HomePage> {
  final themeController = Get.put(ThemeController());
  final giftPageController = Get.put(GiftPageController());

  bool showOverlay = false;
  bool showGiftPage = false;

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
            floatingActionButton: FloatingMenu(),
          ),
        ),
        Obx(() => giftPageController.showGiftPage.value
            ? GestureDetector(
                child: GiftPage(),
                onTap: () {
                  giftPageController.change();
                },
              )
            : Container()),
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
