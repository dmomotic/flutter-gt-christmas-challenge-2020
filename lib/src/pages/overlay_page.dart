import 'package:flutter/material.dart';

class OverlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.85),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/push.gif',
              fit: BoxFit.cover,
              height: 175,
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Tap en las tarjetas',
                textAlign: TextAlign.center,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.black,
                  fontFamily: 'Nerko One',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
