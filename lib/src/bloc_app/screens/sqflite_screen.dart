import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
// import 'package:sqflite/sqflite.dart';

class SqfliteScreen extends StatefulWidget {
  SqfliteScreen({Key key}) : super(key: key);

  @override
  _SqfliteScreenState createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  final logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
            width: double.infinity,
            child: FlatButton(
                onPressed: () {
                  _openDatabase();
                },
                child: Text('data')))
      ]),
    );
  }

  _openDatabase() async* {
    // var db = await openDatabase('my_db.db');
    logger.d('aaaaaaaaaaaaaaaaa');
  }
}
