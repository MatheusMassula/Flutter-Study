import 'package:ch8_tabbar/pages/birthdays.dart';
import 'package:ch8_tabbar/pages/gratitude.dart';
import 'package:ch8_tabbar/pages/reminders.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _tabChanged() {
    if(_tabController.indexIsChanging) {
      print('tab changed: ${_tabController.index}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: TabBarView(
          controller: _tabController,
          children: [
            Birthdays(),
            Gratitude(),
            Reminders()
          ]
        )
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _tabController,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black38,
          tabs: [
            Tab(icon: Icon(Icons.cake), text: 'Birthdays'),
            Tab(icon: Icon(Icons.sentiment_satisfied), text: 'Gratitude'),
            Tab(icon: Icon(Icons.access_alarm), text: 'Reminders'),
          ]
        )
      ),
    );
  }
}