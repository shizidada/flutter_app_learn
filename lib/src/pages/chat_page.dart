import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  ChatPage({
    Key key,
    this.userId,
    this.username,
  }) : super(key: key);

  final String userId;
  final String username;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.username),
          centerTitle: true,
        ),
        body: Container(
          child: Row(
            children: <Widget>[Text(widget.username)],
          ),
        ),
      ),
    );
  }
}
