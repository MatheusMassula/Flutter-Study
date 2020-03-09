import 'package:ch11_dismissible/classes/trip.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Trip> _tripList = List<Trip>();

  @override
  void initState() {
    super.initState();
    _tripList
      ..add(Trip(id: '0', tripName: 'Alemanha', tripLocation: 'Logo ali'))
      ..add(Trip(id: '1', tripName: 'Reino Unido', tripLocation: 'Logo aqui'))
      ..add(Trip(id: '2', tripName: 'Irlanda', tripLocation: 'Algum outro lugar'))
      ..add(Trip(id: '3', tripName: 'Islandia', tripLocation: 'Lugar nenhum'))
      ..add(Trip(id: '4', tripName: 'Belgica', tripLocation: 'Acabou a criatividade'))
      ..add(Trip(id: '5', tripName: 'Bonito', tripLocation: 'Mãe dizendo pro filho'))
      ..add(Trip(id: '6', tripName: 'Matchu Pictchu', tripLocation: 'Mano'))
      ..add(Trip(id: '7', tripName: 'Lima', tripLocation: 'Peru'))
      ..add(Trip(id: '8', tripName: 'Nova Lima', tripLocation: 'Minas'))
      ..add(Trip(id: '9', tripName: 'Raposos', tripLocation: 'Moskow'))
      ..add(Trip(id: '10', tripName: 'Limeira', tripLocation: 'São Paulo'));
  }

  void _markTripComplete() {

  }

  void _deleteTrip() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _tripList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(_tripList[index].id),
              child: _buildListTile(index: index),
              background: _buildCompleteTrip(),
              secondaryBackground: _buildRemoveTrip(),
              onDismissed: (DismissDirection direction) {
                direction == DismissDirection.endToStart ? _markTripComplete() : _deleteTrip();

                setState(() {
                  _tripList.removeAt(index);
                });
              },
            );
          }
        )
      ),
    );
  }

  ListTile _buildListTile({int index}) {
    return ListTile(
      title: Text('${_tripList[index].tripName}'),
      subtitle: Text('${_tripList[index].tripLocation}'),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(Icons.check, color: Colors.white),
          ],
        ),
      ),
    );
  }

  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(Icons.delete, color: Colors.white),
          ],
        ),
      ),
    );
  }

}