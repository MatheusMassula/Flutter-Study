import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {}
          ),
        ],
        flexibleSpace: SafeArea(
          child: Icon(
            Icons.photo_camera,
            size: 75.0,
            color: Colors.grey,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(75.0),
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const ContainerWithBoxDecoration(),
                Divider(),
                const ColumnWidget(),
                Divider(),
                const RowWidget(),
                Divider(),
                const ColumnAndRowNestingWidget(),
                Divider(),
                const FlatButtonWidget(),
                Divider(),
                const RaisedButtonWidget(),
                Divider(),
                const IconsButtonWidget(),
                Divider(),
                const PopupMenuButtonWidget(),
                Divider(),
                const ButtonsWidget(),
                Divider(),
                const ButtonBarWidget(),
                Divider(),
                Image(
                  image: AssetImage('assets/images/IMG_1037.JPG'),
                  fit: BoxFit.cover,
                )
              ],
            )
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,
        label: Text('Play'),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(padding: EdgeInsets.all(30))
          ],
        ),
      ),
    );
  }
}

class ContainerWithBoxDecoration extends StatelessWidget {

  const ContainerWithBoxDecoration({Key key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100.0),
          bottomRight: Radius.circular(10),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.lightGreen.shade500
          ]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10.0,
            offset: Offset(0, 10)
          )
        ]
      ),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Flutter World',
            style: TextStyle(
              color: Colors.deepPurple,
              decoration: TextDecoration.underline,
              decorationColor: Colors.deepPurpleAccent,
              decorationStyle: TextDecorationStyle.dotted,
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
            children: <TextSpan>[
              TextSpan(text: ' for'),
              TextSpan(
                text: ' Mobile',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.bold
                )
              )
            ]
          ),
        )
      ),
    );
  }
}

class ColumnWidget extends StatelessWidget {

  const ColumnWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text('Column'),
        Divider(),
        Text('Column'),
        Divider(),
        Text('Column'),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {

  const RowWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Row'),
        Divider(),
        Text('Row'),
        Divider(),
        Text('Row'),
      ],
    );
  }
}

class ColumnAndRowNestingWidget extends StatelessWidget {
  const ColumnAndRowNestingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text('Column'),
        Text('Column'),
        Text('Column'),
        Padding(padding: EdgeInsets.all(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Nested Row'),
            Text('Nested Row'),
            Text('Nested Row'),
          ],
        )
      ],
    );
  }
}

class FlatButtonWidget extends StatelessWidget {
  const FlatButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        FlatButton(
          child: Text('Default Flat'),
          onPressed: () {},
        ),
        FlatButton(
          child: Icon(Icons.flag),
          color: Colors.lightGreen.shade100,
          onPressed: () {},
        )
      ],
    );
  }
}

class RaisedButtonWidget extends StatelessWidget {
  const RaisedButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('Defalt Raised Button')
        ),
        RaisedButton(
          onPressed: () {},
          child: Icon(Icons.save),
          color: Colors.lightGreen.shade100,
        ),
      ],
    );
  }
}

class IconsButtonWidget extends StatelessWidget {
  const IconsButtonWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.flight),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.flight),
          iconSize: 42,
          color: Colors.redAccent.shade700,
          tooltip: 'Flight',
        ),
      ],
    );
  }
}

class TodoMenuItem {
  final String title;
  final Icon icon;

  TodoMenuItem({this.title, this.icon});
}

List<TodoMenuItem> taskList = [
  TodoMenuItem(title: 'Task 1', icon: Icon(Icons.check_box)),
  TodoMenuItem(title: 'Task 2', icon: Icon(Icons.check_box_outline_blank)),
  TodoMenuItem(title: 'Add new task', icon: Icon(Icons.add_box)),
];

class PopupMenuButtonWidget extends StatelessWidget implements PreferredSizeWidget {
  const PopupMenuButtonWidget({Key key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(75);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<TodoMenuItem>(
      icon: Icon(Icons.view_list),
      onSelected: (selectedTask) {
        print('Title: ${selectedTask.title}');
      },
      itemBuilder: (BuildContext context) {
        return taskList.map(
          (TodoMenuItem task) {
            return PopupMenuItem<TodoMenuItem>(
              value: task,
              child: Row(
                children: <Widget>[
                  Icon(task.icon.icon),
                  Padding(padding: EdgeInsets.all(8)),
                  Text(task.title)
                ],
              ),
            );
          }
        ).toList();
      },
    );
  }
}

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16)),
            FlatButton(
              onPressed: () {},
              child: Text('Flag'),
            ),
            Padding(padding: EdgeInsets.all(16)),
            FlatButton(
              onPressed: () {},
              child: Icon(Icons.flag),
              color: Colors.lightGreen,
              textColor: Colors.white,
            )
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16)),
            RaisedButton(
              onPressed: () {},
              child: Text('Save'),
            ),
            Padding(padding: EdgeInsets.all(16)),
            RaisedButton(
              onPressed: () {},
              child: Icon(Icons.save),
              color: Colors.lightGreen,
            )
          ],
        ),
        Divider(),
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(16)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.flight),
            ),
            Padding(padding: EdgeInsets.all(16)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.flight),
              iconSize: 42,
              color: Colors.lightGreen,
              tooltip: 'Flight',
            ),
          ],
        )
      ],
    );
  }
}

class ButtonBarWidget extends StatelessWidget {
  const ButtonBarWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(icon: Icon(Icons.map), onPressed: () {}),
          IconButton(icon: Icon(Icons.flag), onPressed: () {}),
          IconButton(icon: Icon(Icons.crop_original), onPressed: () {}),
        ],
      ),
    );
  }
}
