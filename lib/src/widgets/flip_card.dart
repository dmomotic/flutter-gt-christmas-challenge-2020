import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../constants/images.dart';

class CustomFlipCard extends StatefulWidget {
  CustomFlipCard({@required this.index, @required this.cardKey});

  final int index;
  final GlobalKey<FlipCardState> cardKey;

  @override
  _CustomFlipCardState createState() => _CustomFlipCardState();
}

class _CustomFlipCardState extends State<CustomFlipCard>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FlipCard(
      key: widget.cardKey,
      direction: widget.index % 2 == 0
          ? FlipDirection.HORIZONTAL
          : FlipDirection.VERTICAL,
      front: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          images[widget.index],
          fit: BoxFit.cover,
        ),
      ),
      back: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          background[widget.index],
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
