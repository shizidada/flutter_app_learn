import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/models/message_model.dart';
import 'package:flutter_app_learn/src/provider/chat_provider.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  ChatPage({
    Key key,
    this.toId,
    this.username,
  }) : super(key: key);

  final String toId;
  final String username;

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textEditingController;

  FocusNode nodeText;

  @override
  void initState() {
    super.initState();

    textEditingController = TextEditingController();
    nodeText = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  KeyboardActionsConfig _buildConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardAction(
          focusNode: nodeText,
          // footerBuilder: (_) => PreferredSize(
          //     child: SizedBox(
          //         height: 40,
          //         child: Center(
          //           child: Text('Custom Footer'),
          //         )),
          //     preferredSize: Size.fromHeight(40)),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ChatProvider chatProvider = Provider.of<ChatProvider>(context);
    List<MessageModel> messages = chatProvider.messages;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
        centerTitle: true,
      ),
      body: KeyboardActions(
        config: _buildConfig(context),
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  height: ScreenUtil.getInstance().setHeight(500),
                  child: ListView.builder(
                    itemCount: messages.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      MessageModel messageModel = messages[index];
                      return ListTile(
                        title: Text(
                          messageModel.from.username,
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(messageModel.msg,
                            style: TextStyle(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        leading: Image.network(messageModel.from.avatar),
                        trailing: Icon(Icons.reply),
                      );
                    },
                  ),
                ),
                Container(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.sentiment_satisfied),
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: TextField(
                          focusNode: nodeText,
                          decoration: InputDecoration(
                            hintText: "请输入评论",
                          ),
                          controller: textEditingController,
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.send,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _sendMessage(context, chatProvider);
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _sendMessage(BuildContext context, ChatProvider chatProvider) {
    String message = textEditingController.text.trim();
    if (message.isEmpty) {
      ToastUtil.showToast(message: "请输入消息");
      return;
    }
    String jsonMessage = jsonEncode(
      {
        "toId": widget.toId,
        'msg': message,
      },
    );
    chatProvider.sendMessage(jsonMessage);
    textEditingController.text = "";
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
