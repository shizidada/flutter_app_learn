import 'package:flutter/material.dart';

class ATHMessageScreen extends StatefulWidget {
  @override
  _ATHMessageScreenState createState() => _ATHMessageScreenState();
}

class _ATHMessageScreenState extends State<ATHMessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: Center(
        child: Text("消息中心"),
      ),
    );
  }
}
