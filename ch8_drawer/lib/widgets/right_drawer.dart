import 'package:ch8_drawer/widgets/menu_list_tile.dart';
import 'package:flutter/material.dart';

class RightDrawerWidget extends StatelessWidget {
  const RightDrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: Icon(
              Icons.face,
              size: 128,
              color: Colors.white,
            ),
            decoration: BoxDecoration(color: Colors.blue),
          ),
          const MenuListTileWidget()
        ],
      ),
    );
  }
}