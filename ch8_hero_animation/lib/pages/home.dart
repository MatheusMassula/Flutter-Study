import 'package:flutter/material.dart';

import 'screen_two.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero animation'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Screen2())
              );
            },
            child: Hero(
              tag: 'format_paint',
              child: Icon(
                Icons.format_paint,
                color: Colors.lightGreen,
                size: 120,
              )
            ),
          )
        )
      ),
    );
  }
}