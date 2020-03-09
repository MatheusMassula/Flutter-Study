import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Layouts',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
        brightness: Brightness.light,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: null),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.cloud_queue), onPressed: null)
        ],
      ),
      body: _buildBody(),
    );
  }

  SingleChildScrollView _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildJournalHeaderImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildJournalEntry(),
                  Divider(),
                  _buildJournalWeather(),
                  Divider(),
                  _buildJournalTags(),
                  Divider(),
                  _buildJournalFooterImages(),
                ],
              ),
            )
          )
        ],  
      ),
    );
  }

  Image _buildJournalHeaderImage() {
    return Image.asset('assets/images/present.jpg', fit: BoxFit.cover);
  }

  Column _buildJournalEntry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'My birthday',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold
          ),
        ),
        Divider(),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: TextStyle(color: Colors.black54),
        ),

      ],
    );
  }

  Row _buildJournalWeather() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[Icon(Icons.wb_sunny, color: Colors.orange)],
        ),
        SizedBox(width: 16,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '25º Clear',
                  style: TextStyle(color: Colors.orange)
                )
              ]
            ),
            Row(
              children: <Widget>[
                Text(
                  'Belo Horizonte, Minas Gerais, Brasil',
                  style: TextStyle(color: Colors.grey)
                )
              ]
            )
          ],
        )
      ],
    );
  }

  Wrap _buildJournalTags() {
    return Wrap(
      spacing: 8,
      children: List.generate(8, (int index) {
        return Chip(
          label: Text(
            'Gift ${index + 1}',
            style: TextStyle(fontSize: 10),
          ),
          avatar: Icon(Icons.card_giftcard, color: Colors.blue.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: Colors.grey)
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Row _buildJournalFooterImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/salmon.jpg'),
          radius: 40,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/asparagus.jpg'),
          radius: 40,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/strawberries.jpg'),
          radius: 40,
        ),
        SizedBox(
          width: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.cake),
              Icon(Icons.star_border),
              Icon(Icons.music_note),
              Icon(Icons.movie),
            ],
          ),
        )
      ],
    );
  }

}