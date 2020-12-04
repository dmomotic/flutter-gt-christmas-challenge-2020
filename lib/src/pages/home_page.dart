import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../constants/images.dart';
import '../state/theme_controller.dart';

class HomePage extends StatelessWidget {
  final themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AnimationLimiter(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 3,
                itemCount: images.length,
                itemBuilder: (ctx, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      horizontalOffset: 75.0,
                      child: FadeInAnimation(
                        child: FlipCard(
                          direction: index % 2 == 0
                              ? FlipDirection.HORIZONTAL
                              : FlipDirection.VERTICAL,
                          front: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          back: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.asset(
                              background[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                staggeredTileBuilder: (index) => StaggeredTile.count(
                    (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            themeController.change();
          },
        ),
      ),
    );
  }
}
