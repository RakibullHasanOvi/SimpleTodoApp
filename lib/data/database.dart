import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List totolist = [];

//Refarence our box
  final _myBox = Hive.box('Mybox');

//!When run this app first time then show this methods..
  void createInitialData() {
    totolist = [
      ['Mr. Rakibull Hasan Ovi', false],
      ['Mrs. Rakibull Hasan', false],
    ];
  }

//!load the data from database
  void loadData() {
    totolist = _myBox.get('TODOLIST');
  }

//!Update the database..
  void updateDatabase() {
    _myBox.put('TODOLIST', totolist);
  }
}
