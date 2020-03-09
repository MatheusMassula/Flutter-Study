import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.shortestSide / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Hero(
          tag: 'format_paint',
          child: Container(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.format_paint,
              color: Colors.lightGreen,
              size: _width,
            ),
          )
        )
      ),
    );
  }
}