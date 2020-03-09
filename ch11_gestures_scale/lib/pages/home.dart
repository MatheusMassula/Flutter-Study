import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Offset _startLastOffset = Offset.zero;
  Offset _lastOffset = Offset.zero;
  Offset _currentOffset = Offset.zero;
  double _lastScale = 1.0;
  double _currentScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context: context)),
    );
  }

  GestureDetector _buildBody({@required BuildContext context}) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) => _onScaleStart(details),
      onScaleUpdate: (ScaleUpdateDetails details) => _onScaleUpdate(details),
      onDoubleTap: () => _onDoubleTap(),
      onLongPress: () => _onLongPress(),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // _transformScaleAndTranslate(),
          _transformMatrix4(),
          _positionedStatusBar(context: context),
          _positionedInkWellAndInkResponse(context: context)
        ],
      ),
    );
  }

  Transform _transformScaleAndTranslate() {
    return Transform.scale(
      scale: _currentScale,
      child: Transform.translate(
        offset: _currentOffset,
        child: Image.asset('assets/images/elephant.jpg'),
      ),
    );
  }

  Transform _transformMatrix4() {
    return Transform(
      transform: Matrix4.identity()
        ..scale(_currentScale, _currentScale)
        ..translate(_currentOffset.dx, _currentOffset.dy),
      alignment: FractionalOffset.center,
      child: Image.asset('assets/images/elephant.jpg'),
    );
  }

  Positioned _positionedStatusBar({@required BuildContext context}) {
    return Positioned(
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Scale: ${_currentScale.toStringAsFixed(4)}'),
            Text('Offset: $_currentOffset')
          ],
        ),
      ),
    );
  }

  void _onScaleStart(ScaleStartDetails details) {
    print('ScaleStartDetails: $details');

    _startLastOffset = details.focalPoint;
    _lastOffset = _currentOffset;
    _lastScale = _currentScale;
  }

  void _onScaleUpdate(ScaleUpdateDetails details) {
    print('ScaleUpdateDetails: $details - Scale: ${details.scale}');

    if(details.scale != 1.0) {
      //Scaling
      double currentScale = _lastScale * details.scale;
      if(currentScale < 0.5) {
        currentScale = 0.5;
      }
      setState(() {
        _currentScale = currentScale;
      });

      print('Scale: $_currentScale - LastScale: $_lastScale');
    }
    else if(details.scale == 1.0) {
      Offset offsetAjustedForScale = (_startLastOffset - _lastOffset) / _lastScale;
      Offset currentOffset = details.focalPoint - (offsetAjustedForScale * _currentScale);

      setState(() {
        _currentOffset = currentOffset;
      });

      print('offsetAjustedForScale: $offsetAjustedForScale - _currentOffset: $_currentOffset');
    }
  }

  void _onDoubleTap() {
    print('onDoubleTap');

    double currentScale = _lastScale * 2;
    if(currentScale > 16) {
      currentScale = 1.0;
      _resetToDefaultValues();
    }

    _lastScale = currentScale;

    setState(() {
      _currentScale = currentScale;
    });
  }

  void _onLongPress() {
    print('onLongPress');

    setState(() {
      _resetToDefaultValues();
    });
  }

  _resetToDefaultValues() {
    _startLastOffset = Offset.zero;
    _lastOffset = Offset.zero;
    _currentOffset = Offset.zero;
    _lastScale = 1.0;
    _currentScale = 1.0;
  }

  Positioned _positionedInkWellAndInkResponse({@required BuildContext context}) {
    return Positioned(
      top: 50,
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: Colors.white54,
        height: 56.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InkWell(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(Icons.touch_app, size: 32),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            ),

            InkResponse(
              child: Container(
                height: 48.0,
                width: 128.0,
                color: Colors.black12,
                child: Icon(Icons.touch_app, size: 32),
              ),
              splashColor: Colors.lightGreenAccent,
              highlightColor: Colors.lightBlueAccent,
              onTap: _setScaleSmall,
              onDoubleTap: _setScaleBig,
              onLongPress: _onLongPress,
            )
          ],
        ),
      ),
    );
  }

  void _setScaleSmall() {
    setState(() {
      _currentScale = 0.5;
    });
  }
  void _setScaleBig() {
    _currentScale = 16.0;
  }
}