import 'package:ch9_gridview/widgets/gridview_builder.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: const GridViewBuildWidget(),
      ),
    );
  }
}