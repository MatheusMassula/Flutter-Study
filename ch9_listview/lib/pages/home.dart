import 'package:ch9_listview/widgets/header.dart';
import 'package:ch9_listview/widgets/row.dart';
import 'package:ch9_listview/widgets/row_with_card.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            if(index == 0) {
              return HeaderWidget(index: index);
            }
            else if(index >= 1 && index <= 3) {
              return RowWithCardWidget(index: index);
            }
            else {
              return RowWidget(index: index);
            }
          },
        )
      ),
    );
  }
}