import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class GiftPage extends StatelessWidget {
  final asset = AssetFlare(bundle: rootBundle, name: "assets/Present.flr");
  final String _animationName = "idle";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.8,
                  height: Get.height * 0.35,
                  child: FlareActor.asset(
                    asset,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: _animationName,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: AnimationConfiguration.synchronized(
                    duration: Duration(milliseconds: 1000),
                    child: FadeInAnimation(
                      child: Text(
                        'Felices fiestas!',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontFamily: 'Nerko One',
                          fontSize: 85.0,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
