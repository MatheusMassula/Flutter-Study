import 'package:flutter/material.dart';

import 'birthdays.dart';
import 'gratitude.dart';
import 'reminders.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  Widget _currentPage;
  List _listPages = List();

  @override
  void initState() {
    super.initState();

    _listPages
      ..add(Birthdays())
      ..add(Gratitude())
      ..add(Reminders());
    
    _currentPage = Birthdays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: _currentPage,
        )
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cake), title: Text('Birthdays')),
          BottomNavigationBarItem(icon: Icon(Icons.sentiment_satisfied), title: Text('Gratitude')),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm), title: Text('Reminders')),
        ],
        currentIndex: _currentIndex,
        onTap: (selectedPage) => _changePage(selectedPage),
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _listPages[index];
    });
  }
}