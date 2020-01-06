import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page_state.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/share_util.dart';

/// 会员
class VipPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _VipPageState();
}

class _VipPageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  _VipPageState() {
    title = Text("会员");
  }

  // 初始化
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
    return Container(
      child: Column(
        children: <Widget>[
          Center(
            child: RaisedButton(
              child: Text("Clear Login Info"),
              onPressed: () {
                SharedUtil.clear();
              },
            ),
          ),
          Center(
            child: RaisedButton(
              child: Text("Video Player"),
              onPressed: () {
                NavigatorUtil.pushFromRight(context, "/video");
              },
            ),
          )
        ],
      ),
    );
  }
}
