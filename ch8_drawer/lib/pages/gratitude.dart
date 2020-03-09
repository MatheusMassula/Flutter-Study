import 'package:flutter/material.dart';

class Gratitude extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        centerTitle: true,
      ),
      body: Center(
        child: Icon(
          Icons.sentiment_satisfied,
          size: 120.0,
        ),
      ),
    );
  }
}