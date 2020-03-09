import 'package:ch13_local_persistence/classes/database.dart';
import 'package:flutter/material.dart';
import 'edit_entry.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Database _database;

  Future<List<Journal>> _loadJournals() async {
    await DataBaseFileRoutines().readJournals().then(
      (journalListJson) {
        _database = dataBaseFromJson(journalListJson);
        _database.journalList.sort(
          (comp1, comp2) => comp2.date.compareTo(comp1.date)
        );
      }
    );

    return _database.journalList;
  }

  void _addOrEditJournal({bool add, int index, Journal journal}) async {
    JournalEdit _journalEdit = JournalEdit(
      action: '',
      journal: journal
    );

    _journalEdit = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditEntry(
          add: add,
          index: index,
          journalEdit: _journalEdit,
        ),
        fullscreenDialog: true
      )
    );

    switch (_journalEdit.action) {
      case 'Save':
        if(add) {
          setState(() {
            _database.journalList.add(_journalEdit.journal);
          });
        }
        else {
          setState(() {
            _database.journalList[index] = _journalEdit.journal;
          });
        }
        DataBaseFileRoutines().writeJournals(dataBaseToJson(_database));
        break;
      
      case 'Cancel':
        break;

      default:
        break;
    }
  }

  Widget _buildListViewSepareted(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (BuildContext context, int index) {
        String _titleDate = DateFormat.yMMMd().format(DateTime.parse(snapshot.data[index].date));
        String _subtitle = snapshot.data[index].mood + '\n' + snapshot.data[index].note;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Dismissible(
            key: Key(snapshot.data[index].id),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            secondaryBackground: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(16),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                _database.journalList.removeAt(index);
              });
              DataBaseFileRoutines().writeJournals(dataBaseToJson(_database));
            },
            child: ListTile(
              leading: Column(
                children: <Widget>[
                  Text(
                    DateFormat.d().format(DateTime.parse(snapshot.data[index].date)),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Colors.blue
                    ),
                  ),

                  Text(DateFormat.E().format(DateTime.parse(snapshot.data[index].date)))
                ],
              ),
              title: Text(
                _titleDate,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              subtitle: Text(_subtitle),
              onTap: () {
                _addOrEditJournal(
                  add: false,
                  index: index,
                  journal: snapshot.data[index]
                );
              },
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.grey,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local persistence'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        initialData: [],
        future: _loadJournals(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData ? _buildListViewSepareted(snapshot) : Center(child: CircularProgressIndicator());
        }
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(padding: const EdgeInsets.all(24)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add journal entry',
        child: Icon(Icons.add),
        onPressed: () async {
          _addOrEditJournal(add: true, index: -1, journal: Journal());
        }
      ),
    );
  }
}