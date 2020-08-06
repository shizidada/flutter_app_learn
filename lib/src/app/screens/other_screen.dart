import 'package:flutter/material.dart';

class OtherScreen extends StatelessWidget {
  final String content;

  const OtherScreen({@required this.content, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("$content")), body: Text("$content Screen"));
  }
}
