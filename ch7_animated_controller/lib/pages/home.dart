import 'package:ch7_animated_controller/widgets/animated_ballon.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                const AnimatedBalloonWidget(),
              ],
            ),
          ),
        )
      ),
    );
  }
}