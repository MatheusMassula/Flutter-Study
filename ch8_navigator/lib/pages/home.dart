import 'package:ch8_navigator/pages/gratitude.dart';
import 'package:flutter/material.dart';

import 'about.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _howAreYou = '...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () => _openPageAbout(
              context: context,
              fullscreenDialog: true
            )
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(
              fontSize: 32.0
            ),
            )
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        child: Icon(Icons.sentiment_satisfied),
        tooltip: 'About',
      ),
    );
  }

  void _openPageAbout({BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About()
      )
    );
  }

  void _openPageGratitude({BuildContext context, bool fullscreenDialog = false}) async {
    final String _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => Gratitude(
          radioGroupValue: -1,
        )
      )
    );
    _howAreYou = _gratitudeResponse ?? '...';
  }
}