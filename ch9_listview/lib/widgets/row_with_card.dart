import 'package:flutter/material.dart';

class RowWithCardWidget extends StatelessWidget {
  RowWithCardWidget({Key key, @required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.flight,
          size: 48,
          color: Colors.lightBlue,
        ),
        title: Text('Airplane $index'),
        subtitle: Text('Very cool'),
        trailing: Text(
          '${index * 7}%',
          style: TextStyle(color: Colors.lightBlue),
        ),
        onTap: () => print('Tapped on row $index'),
      ),
    );
  }
}