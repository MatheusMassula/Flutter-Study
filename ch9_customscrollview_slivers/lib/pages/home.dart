import 'package:ch9_customscrollview_slivers/widgets/sliver_app_bar.dart';
import 'package:ch9_customscrollview_slivers/widgets/sliver_grid.dart';
import 'package:ch9_customscrollview_slivers/widgets/sliver_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Scroll View - Slivers'),
        centerTitle: true,
        elevation: 0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBarWidget(),
          const SliverListWidget(),
          const SliverGridWidget(),
        ],
      ),
    );
  }
}