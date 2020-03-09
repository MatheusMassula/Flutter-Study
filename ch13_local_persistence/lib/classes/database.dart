import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert';

class DataBaseFileRoutines {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    return File('$path/local_persistence.json');
  }

  Future<String> readJournals() async {
    try {
      final file = await _localFile;

      if(!file.existsSync()) {
        await writeJournals('{"journalList": []}');
      }

      String contents = await file.readAsString();

      return contents;
    }
    catch (e) {
      print('Error $e');
      return "";
    }
  }

  Future<File> writeJournals(String json) async {
    final file = await _localFile;

    return file.writeAsString('$json');
  }
}

Database dataBaseFromJson(String data) {
  final dataFromJson = json.decode(data);
  return Database.fromJson(dataFromJson);
}

String dataBaseToJson(Database data) {
  final dataToJson = data.toJson();

  return json.encode(dataToJson);
}

class Database {
  List<Journal> journalList;

  Database({this.journalList});

  factory Database.fromJson(Map<String, dynamic> json) => Database(
    journalList: List<Journal>.from(json["journalList"].map((x) => Journal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    'journalList': List<dynamic>.from(journalList.map((item) => item.toJson()))
  };
}

class Journal {
  String id;
  String date;
  String mood;
  String note;

  Journal({
    this.id,
    this.date,
    this.mood,
    this.note,
  });

  factory Journal.fromJson(Map<String, dynamic> json) => Journal(
    id: json['id'],
    date: json['date'],
    mood: json['mood'],
    note: json['note'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date,
    'mood': mood,
    'note': note,
  };
}

class JournalEdit {
  String action;
  Journal journal;

  JournalEdit({this.action, this.journal});
}