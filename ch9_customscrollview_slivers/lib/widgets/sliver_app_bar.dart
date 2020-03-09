import 'package:flutter/material.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.brown,
      forceElevated: true,
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text('Parallax Effect'),
        background: Image.asset('assets/images/desk.jpg', fit: BoxFit.cover),
      ),
    );
  }
}