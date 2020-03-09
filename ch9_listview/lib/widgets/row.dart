import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  RowWidget({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.directions_car,
        size: 48,
        color: Colors.lightGreen,
      ),
      title: Text('Car $index'),
      subtitle: Text('Very cool'),
      trailing: (index % 3).isEven ? Icon(Icons.bookmark_border) : Icon(Icons.bookmark),
      selected: false,
      onTap: () => print('Car $index'),
    );
  }
}