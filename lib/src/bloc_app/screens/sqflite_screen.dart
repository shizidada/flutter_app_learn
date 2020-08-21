import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/repository/database_helper.dart';
import 'package:flutter_app_learn/src/bloc_app/repository/user_repository.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteScreen extends StatefulWidget {
  SqfliteScreen({Key key}) : super(key: key);

  @override
  _SqfliteScreenState createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  final logger = Logger();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite"),
      ),
      body: Column(children: [
        FlatButton(
            onPressed: () {
              _addUser();
            },
            child: Text('add User')),
        FlatButton(
            onPressed: () {
              _findAll();
            },
            child: Text('findAll')),
      ]),
    );
  }

  void _addUser() {
    Map<String, dynamic> values = HashMap<String, dynamic>();
    values[UserRepository.userName] = "goudan";
    var data = UserRepository().addUser(values);
    print(data);
  }

  void _findAll() async {
    List<Map<String, dynamic>> data = await UserRepository().findAll();
    data.forEach((element) {
      print(element[UserRepository.userName]);
    });
  }

  void _openDatabase() async {
    var databasesPath = await getDatabasesPath();
    print(databasesPath);

    String path = join(databasesPath, 'my_db.db');
    print(path);

    var db = await openDatabase('my_db.db');
    print(db);

//    String sql =
//        '''CREATE TABLE Company ( id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT )''';
//    db.execute(sql);

//    Map<String, dynamic> values = HashMap<String, dynamic>();
//    values['name'] = "zhangsan";
//
//    db.insert('Company', values);
//
    var result = await db.query('Company');
    print(result);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    DatabaseHelper.instance.close();
    super.dispose();
  }
}
