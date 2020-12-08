import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:unicorndial/unicorndial.dart';

import '../state/theme_controller.dart';
import '../constants/card_controllers.dart';
import '../state/gift_page_controller.dart';

class FloatingMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final giftPageController = Get.find<GiftPageController>();
    final childButtons = <UnicornButton>[
      UnicornButton(
        hasLabel: true,
        labelText: 'Girar',
        currentButton: FloatingActionButton(
          heroTag: '1',
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.api),
          onPressed: () {
            cardControllers.forEach((element) {
              element.currentState.toggleCard();
            });
          },
        ),
      ),
      UnicornButton(
        hasLabel: true,
        labelText: 'Regalo',
        currentButton: FloatingActionButton(
          heroTag: '2',
          backgroundColor: Colors.deepOrange,
          child: Icon(Icons.card_giftcard),
          onPressed: () {
            giftPageController.change();
          },
        ),
      ),
      UnicornButton(
        hasLabel: true,
        labelText: 'Cambiar tema',
        currentButton: FloatingActionButton(
          heroTag: '3',
          backgroundColor: Colors.redAccent,
          child: Icon(Icons.autorenew),
          onPressed: () {
            themeController.change();
          },
        ),
      ),
    ];

    return UnicornDialer(
        orientation: UnicornOrientation.VERTICAL,
        parentButton: Icon(Icons.add),
        childButtons: childButtons);
  }
}
