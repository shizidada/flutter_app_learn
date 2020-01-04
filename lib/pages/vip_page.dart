import 'package:flutter/material.dart';
import 'package:flutter_app_learn/base/base_page_state.dart';

/// Vip
class VipPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _VipPageState();
}

class _VipPageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  _VipPageState() {
    title = Text("Vip");
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
      return Container(child: Text('vip_page'),);
  }
}
