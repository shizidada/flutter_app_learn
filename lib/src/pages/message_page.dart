import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page_state.dart';

/// 消息
class MessagePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState<MessagePage> extends BasePageState
    with SingleTickerProviderStateMixin {

  @override
  void initState() {
    title = Text('消息');
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(context) {
    print(' ------ MessagePage ------ ');
    return Text("MessagePage");
  }
}
