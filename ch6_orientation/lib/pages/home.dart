import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const OrientationLayoutIconWidgets(),
                Divider(),
                const OrientationLayoutWidgets(),
                Divider(),
                const GridViewWidget(),
                Divider(),
                const OrientationBuilderWidget()
              ],
            ),
          ),
        )
      ),
    );
  }
}

class OrientationLayoutIconWidgets extends StatelessWidget {
  const OrientationLayoutIconWidgets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.portrait ?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.ac_unit,
            size: 48,
          )
        ],
      )
    :
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.ac_unit,
            size: 48,
          ),
          Icon(
            Icons.access_alarm,
            size: 48,
          ),
        ],
      )
    ;
  }
}

class OrientationLayoutWidgets extends StatelessWidget {
  const OrientationLayoutWidgets({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return orientation == Orientation.portrait ?
      Container(
        alignment: Alignment.center,
        color: Colors.yellow,
        child: Text('portrait'),
        height: 100,
        width: 100,
      )  
    :
      Container(
        alignment: Alignment.center,
        color: Colors.lightGreen,
        child: Text('landscape'),
        height: 100,
        width: 200,
      )
    ;
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
      childAspectRatio: 5,
      children: List.generate(8,
        (int index) {
          return Text('Grid $index', textAlign: TextAlign.center,);
        }
      ),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return orientation == Orientation.portrait ?
          Container(
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text('portrait'),
            height: 100,
            width: 100,
          )  
        :
          Container(
            alignment: Alignment.center,
            color: Colors.lightGreen,
            child: Text('landscape'),
            height: 100,
            width: 200,
          )
        ;
      }
    );
  }
}