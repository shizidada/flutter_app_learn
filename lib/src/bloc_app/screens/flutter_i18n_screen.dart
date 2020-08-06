import 'package:flutter/material.dart';

class Flutteri18nScreen extends StatefulWidget {
  Flutteri18nScreen({Key key}) : super(key: key);

  @override
  _Flutteri18nScreenState createState() => _Flutteri18nScreenState();
}

class _Flutteri18nScreenState extends State<Flutteri18nScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Flutter i18n")),
        body: Container(
          child: Text('data'),
        ));
  }
}
