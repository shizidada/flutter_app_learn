import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

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
  IOWebSocketChannel _webSocketChannel;
  @override
  void initState() {
    super.initState();
    _webSocketChannel = IOWebSocketChannel.connect(
        "ws://127.0.0.1:7000/ws/5e0b6d05424ac70ab28b70b6");
    _webSocketChannel.stream.listen(_socketChannelDataListen,
        onError: _socketChannelErrorListen, onDone: _socketChannelDoneListen);
  }

  _socketChannelDataListen(message) {
    // _webSocketChannel.sink.close(status.goingAway);
    print(message);
    print('------------ _socketChannelDataListen ---------------');
  }

  _socketChannelErrorListen(message) {
    print('----------- _socketChannelErrorListen ----------------');
  }

  _socketChannelDoneListen() {
    _webSocketChannel.sink.add("received!");
    print('-------------- _socketChannelDoneListen -------------');
  }

  @override
  void dispose() {
    // _webSocketChannel.sink.close(status.goingAway);
    super.dispose();
  }

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
            children: <Widget>[
              Text(widget.username),
              RaisedButton(
                child: Text('Send Message'),
                onPressed: () {
                  _sendMessage();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void _sendMessage() {
    _webSocketChannel.sink.add(
      jsonEncode(
        {
          "toId": widget.userId,
          'msg': 'Hi i\'m test message',
        },
      ),
    );
  }
}
