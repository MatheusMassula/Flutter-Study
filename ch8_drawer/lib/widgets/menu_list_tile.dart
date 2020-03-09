import 'package:ch8_drawer/pages/birthdays.dart';
import 'package:ch8_drawer/pages/gratitude.dart';
import 'package:ch8_drawer/pages/reminders.dart';
import 'package:flutter/material.dart';

class MenuListTileWidget extends StatelessWidget {
  const MenuListTileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height - 250,
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.cake),
            title: Text('Birthdays'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Birthdays()
                )
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.sentiment_satisfied),
            title: Text('Gratitude'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Gratitude()
                )
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            title: Text('Reminders'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Reminders()
                )
              );
            },
          ),

          Divider(color: Colors.grey),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}