import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  @override
  _AnimatedCrossFadeWidgetState createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = true;

  _crossFade() {
    setState(() {
      _crossFadeStateShowFirst = !_crossFadeStateShowFirst;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedCrossFade(
              firstChild: Container(
                height: 200,
                width: 200,
                color: Colors.lime,
              ),
              secondChild: Container(
                height: 100,
                width: 100,
                color: Colors.amber,
              ),
              crossFadeState: _crossFadeStateShowFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              sizeCurve: Curves.bounceOut,
              duration: Duration(milliseconds: 500)
            ),
            Positioned.fill(
              child: FlatButton(
                onPressed: () => _crossFade(),
                child: Text('Tap to \nFade Color & Size')
              )
            ),
          ],
        )
      ],
    );
  }
}