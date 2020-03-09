import 'package:ch9_gridview/classes/grid_icons.dart';
import 'package:flutter/material.dart';

class GridViewBuildWidget extends StatelessWidget {
  const GridViewBuildWidget({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    List<IconData> _iconList = GridIcons().getIconList;

    return GridView.builder(
      itemCount: 20,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 150),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.lightGreen.shade50,
          margin: EdgeInsets.all(8),
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  _iconList[index],
                  size: 48,
                  color: Colors.lightGreen,
                ),
                Divider(),
                Text(
                  'index $index',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            onTap: () => print('Index $index'),
          ),
        );
      },
    );
  }
}