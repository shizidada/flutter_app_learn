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
  bool get wantKeepAlive => true;

  _MessagePageState() {
    title = Text('消息');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(context) {
    return Text("MessagePage");
  }
}
