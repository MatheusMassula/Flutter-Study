import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  @override
  _AnimatedContainerWidgetState createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100;
  double _width = 100;

  _increaseWidth() {
    setState(() {
      _width = _width >= 320 ? 100.0 : _width += 50;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.elasticOut,
          color: Colors.amber,
          height: _height,
          width: _width,
          child: FlatButton(
            onPressed: () => _increaseWidth(),
            child: Text('Tap tp\nGrow width\n$_width')
          ),
        ),
      ],
    );
  }
}