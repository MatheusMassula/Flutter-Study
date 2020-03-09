import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  @override
  _AnimatedOpacityWidgetState createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  double _opacity = 1;

  _animatedOpacity() {
    setState(() {
      _opacity = _opacity == 1 ? 0.3 : 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(milliseconds: 500),
          child: Container(
            color: Colors.amber,
            height: 100,
            width: 100,
            child: FlatButton(
              onPressed: () => _animatedOpacity(),
              child: Text('Tap to fade')
            ),
          ),
        )
      ],
    );
  }
}