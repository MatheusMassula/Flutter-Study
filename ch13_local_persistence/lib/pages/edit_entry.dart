import 'dart:math';

import 'package:ch13_local_persistence/classes/database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EditEntry extends StatefulWidget {
  final bool add;
  final int index;
  final JournalEdit journalEdit;

  const EditEntry({
    Key key,
    this.add,
    this.index,
    this.journalEdit,
    }) : super(key: key);
  
  @override
  _EditEntryState createState() => _EditEntryState();
}

class _EditEntryState extends State<EditEntry> {
  JournalEdit _journalEdit;
  String _title;
  DateTime _selectedDate;
  TextEditingController _moodController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  FocusNode _moodFocus = FocusNode();
  FocusNode _noteFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _journalEdit = JournalEdit(action: 'Cancel', journal: widget.journalEdit.journal);
    _title = widget.add ? 'Add' : 'Edit';

    if(widget.add) {
      _selectedDate = DateTime.now();
      _moodController.text = '';
      _noteController.text = '';
    }
    else {
      _selectedDate = DateTime.parse(_journalEdit.journal.date);
      _moodController.text = _journalEdit.journal.mood;
      _noteController.text = _journalEdit.journal.note;
    }
  }

  @override
  void dispose() {
    _moodController.dispose();
    _noteController.dispose();
    _moodFocus.dispose();
    _noteFocus.dispose();
    super.dispose();    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title Entry'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              FlatButton(
                padding: const EdgeInsets.all(0),
                onPressed: () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  DateTime _pickerData = await _selectDate(_selectedDate);
                  setState(() {
                    _selectedDate = _pickerData;
                  });
                },
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 22,
                      color: Colors.black,
                    ),

                    SizedBox(width: 16),

                    Text(
                      DateFormat.yMMMEd().format(_selectedDate),
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold
                      ),
                    ),

                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black54,
                    ),
                  ],
                )
              ),

              TextField(
                controller: _moodController,
                autofocus: true,
                textInputAction: TextInputAction.next,
                focusNode: _moodFocus,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Mood',
                  icon: Icon(Icons.mood)
                ),
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_noteFocus);
                },
              ),

              TextField(
                controller: _noteController,
                autofocus: true,
                textInputAction: TextInputAction.newline,
                focusNode: _noteFocus,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  labelText: 'Note',
                  icon: Icon(Icons.subject)
                ),
                maxLines: null,
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_noteFocus);
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Text('CANCEL'),
                    color: Colors.grey.shade100,
                    onPressed: () {
                      _journalEdit.action = 'Cancel';
                      Navigator.pop(context, _journalEdit);
                    },
                  ),

                  FlatButton(
                    child: Text('SAVE'),
                    color: Colors.lightGreen.shade100,
                    onPressed: () {
                      _journalEdit.action = 'Save';
                      String _id = widget.add ? Random().nextInt(9999999).toString() : _journalEdit.journal.id;
                      _journalEdit.journal = Journal(
                        id: _id,
                        date: _selectedDate.toString(),
                        mood: _moodController.text,
                        note: _noteController.text,
                      );
                      Navigator.pop(context, _journalEdit);
                    },
                  ),
                ],
              )
            ],
          ),
        )
        ),
    );
  }

  Future<DateTime> _selectDate(DateTime selectedDate) async {
    DateTime _initialDate = selectedDate;

    final DateTime _pickedDate = await showDatePicker(
      context: context,
      initialDate: _initialDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365))
    );

    if(_pickedDate != null) {
      selectedDate = DateTime(
        _pickedDate.year,
        _pickedDate.month,
        _pickedDate.day,
        _pickedDate.hour,
        _pickedDate.minute,
        _pickedDate.second,
        _pickedDate.millisecond,
        _pickedDate.microsecond,
      );
    }

    return selectedDate;
  }
}