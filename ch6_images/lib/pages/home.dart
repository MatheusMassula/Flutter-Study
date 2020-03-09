import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                const ImageAndIconWidget(),
                Divider(),
                const BoxDecoratorWidget(),
                Divider(),
                const InputDecoratorsWidget(),
                Divider(),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class ImageAndIconWidget extends StatelessWidget {
  const ImageAndIconWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Image(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width / 3,
        ),

        Image.network(
          'https://flutter.io/images/catalog-widget-placeholder.png',
          width: MediaQuery.of(context).size.width / 3,
        ),

        Icon(
          Icons.brush,
          color: Colors.lightBlue,
          size: 48.0
        )
      ],
    );
  }
}

class BoxDecoratorWidget extends StatelessWidget {
  const BoxDecoratorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(0, 10)
            )
          ]
        ),
      ),
    );
  }
}

class InputDecoratorsWidget extends StatelessWidget {
  const InputDecoratorsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 16.0
          ),
          decoration: InputDecoration(
            labelText: 'Notes',
            labelStyle: TextStyle(
              color: Colors.purple
            ),
            border: OutlineInputBorder()
          ),
        ),

        Divider(),

        TextField(
          decoration: InputDecoration(labelText: 'Enter your note'),
        )
      ],
    );
  }
}
