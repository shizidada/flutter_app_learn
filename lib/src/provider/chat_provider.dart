import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/models/message_model.dart';
import 'dart:convert';
import 'package:flutter_app_learn/src/models/user_model.dart';
import 'package:flutter_app_learn/src/models/friends_list_model.dart';
import 'package:flutter_app_learn/src/service/index.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class ChatProvider with ChangeNotifier {
  String mimeId = '5e1533664af7df11002c10ab';

  IOWebSocketChannel _webSocketChannel;

  FriendsListModel friendsListModel;

  UserModel currentUser = UserModel(
      '5e1533664af7df11002c10ab',
      '狮子',
      '你还会啊，好开心😄',
      '1',
      '15370315010',
      'https://avatars1.githubusercontent.com/u/14831261?s=64&v=4',
      'shizidada@gmail.com',
      1578447671486,
      1578447671486);

  List<MessageModel> chatMessages = [];

  List<MessageModel> get messages => chatMessages;

  ChatProvider() {
    print(" ---- ChatProvider ---- ");
    this.getFriendsList(null);

    _webSocketChannel =
        IOWebSocketChannel.connect("ws://10.0.2.2:7000/ws/$mimeId");
    _webSocketChannel.stream.listen(_socketChannelDataListen,
        onError: _socketChannelErrorListen, onDone: _socketChannelDoneListen);
  }

  _socketChannelDataListen(message) {
    // _webSocketChannel.sink.close(status.goingAway);
    // print(message);
    final jsonMap = json.decode(message);
    MessageModel messageModel = MessageModel.fromJson(jsonMap);
    // print(messageModel.toJson());
    // print('------------ _socketChannelDataListen ---------------');
    chatMessages.add(messageModel);
    notifyListeners();
  }

  _socketChannelErrorListen(message) {
    print('----------- _socketChannelErrorListen ----------------');
  }

  _socketChannelDoneListen() {
    _webSocketChannel.sink.add("received!");
    print('-------------- _socketChannelDoneListen -------------');
  }

  /// 获取 friend list
  getFriendsList(params) {
    if (friendsListModel == null)
      RequestUtil.getFriendsList(params, success: (data) {
        friendsListModel = FriendsListModel.fromJson(data);
        notifyListeners();
      }, failure: (error) {
        print(error);
      });
  }

  @override
  void dispose() {
    super.dispose();
    _webSocketChannel.sink.close(status.goingAway);
  }

  void sendMessage(String jsonMessage) {
    print(jsonMessage);
    _webSocketChannel.sink.add(jsonMessage);
  }
}
