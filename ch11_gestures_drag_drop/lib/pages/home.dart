import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _gestureDetected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _buildBuildGestureDetector(),
              Divider(color: Colors.black, height: 44),
              _buildBuildDraggable(),
              Divider(color: Colors.black, height: 44),
              _buildBuildDragTarget(),
              Divider(color: Colors.black, height: 44),
            ],
          ),
        )
      ),
    );
  }

  GestureDetector _buildBuildGestureDetector() {
    return GestureDetector(
      onTap: () {
        _displayGestureDetected('onTap');
      },
      onDoubleTap: () {
        _displayGestureDetected('onDoubleTap');
      },
      onLongPress: () {
        _displayGestureDetected('onLongPress');
      },
      onPanUpdate: (DragUpdateDetails details) {
        _displayGestureDetected('onPanUpdate');
        print('details: $details');
      },
      child: Container(
        color: Colors.lightGreen.shade100,
        width: double.infinity,
        padding: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            Icon(Icons.alarm, size: 98),
            Text('Gesture detected: $_gestureDetected')
          ],
        ),
      ),
    );
  }

  void _displayGestureDetected(String gesture) {
    setState(() {
      _gestureDetected = gesture;
    });
  }

  Draggable<int> _buildBuildDraggable() {
    return Draggable(
      child: Column(
        children: <Widget>[
          Icon(Icons.palette, size: 48, color: Colors.deepOrange),
          Text('Drags me below to change the color')
        ],
      ),
      childWhenDragging: Icon(Icons.palette, size: 48, color: Colors.grey),
      feedback: Icon(Icons.brush, size: 48, color: Colors.deepOrange),
      data: Colors.deepOrange.value,
    );
  }

  DragTarget<int> _buildBuildDragTarget() {
    Color _paintedColor;

    return DragTarget<int>(
      onAccept: (colorValue) {
        _paintedColor = Color(colorValue);
      },
      builder: (BuildContext context, List<dynamic> acceptedData, List<dynamic> rejectedData) =>
        acceptedData.isEmpty ?
        Text(
          'Drag to see the color change',
          style: TextStyle(color: _paintedColor)
        )
        : Text(
          'Painting color $acceptedData',
          style: TextStyle(
            color: Color(acceptedData[0]),
            fontWeight: FontWeight.bold
          )
        ),
    );
  }
}