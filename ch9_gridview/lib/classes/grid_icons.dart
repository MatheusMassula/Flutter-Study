import 'package:flutter/material.dart';

class GridIcons {
  List<IconData> _iconList = [];

  List<IconData> get getIconList {

    if(_iconList.isEmpty) {
      _iconList
      ..add(Icons.ac_unit)
      ..add(Icons.access_alarm)
      ..add(Icons.access_time)
      ..add(Icons.accessibility)
      ..add(Icons.accessibility_new)
      ..add(Icons.accessible)
      ..add(Icons.accessible_forward)
      ..add(Icons.account_balance)
      ..add(Icons.account_balance_wallet)
      ..add(Icons.account_box)
      ..add(Icons.account_circle)
      ..add(Icons.adb)
      ..add(Icons.add)
      ..add(Icons.add_a_photo)
      ..add(Icons.add_alarm)
      ..add(Icons.add_alert)
      ..add(Icons.add_box)
      ..add(Icons.add_call)
      ..add(Icons.add_circle)
      ..add(Icons.add_circle_outline);
    }

    return _iconList;
  }
}