import 'package:flutter/material.dart';

class OtherPage extends StatelessWidget {
  final String content;

  const OtherPage({@required this.content, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("$content")), body: Text("$content Page"));
  }
}
