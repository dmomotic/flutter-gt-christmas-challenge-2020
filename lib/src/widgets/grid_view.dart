import 'package:flutter/material.dart';
import 'package:flutter_challenge_gt/src/constants/card_controllers.dart';
import 'package:flutter_challenge_gt/src/constants/images.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'flip_card.dart';

class CustomGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      addAutomaticKeepAlives: true,
      crossAxisCount: 3,
      itemCount: images.length,
      physics: ClampingScrollPhysics(),
      itemBuilder: (ctx, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: SlideAnimation(
            verticalOffset: 50.0,
            horizontalOffset: 75.0,
            child: FadeInAnimation(
              child: CustomFlipCard(
                index: index,
                cardKey: cardControllers[index],
              ),
            ),
          ),
        );
      },
      staggeredTileBuilder: (index) => StaggeredTile.count(
          (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
    );
  }
}
