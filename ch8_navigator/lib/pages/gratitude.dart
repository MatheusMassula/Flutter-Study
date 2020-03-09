import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  int radioGroupValue;

  Gratitude({Key key, @required int radioGroupValue}) : super(key: key);

  @override
  _GratitudeState createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  List<String> _gratitudeList = ['Family', 'Friends', 'Coffee'];
  String _selectedGratitude;
  int _radioGroupValue;

  @override
  void initState() {
    super.initState();

    _radioGroupValue = widget.radioGroupValue;
  }

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gratitude'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude)
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Radio(value: 0, groupValue: _radioGroupValue, onChanged: (index) => _radioOnChanged(index)),
              Text('Family'),
              Radio(value: 1, groupValue: _radioGroupValue, onChanged: (index) => _radioOnChanged(index)),
              Text('Friends'),
              Radio(value: 2, groupValue: _radioGroupValue, onChanged: (index) => _radioOnChanged(index)),
              Text('Coffee'),
            ],
          ),
        )
      ),
    );
  }
}