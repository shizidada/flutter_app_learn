import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page_state.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/share_util.dart';
import 'package:flutter_app_learn/src/widgets/comment_Item_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 会员
class VipPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _VipPageState();
}

class _VipPageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  // 初始化
  @override
  void initState() {
    title = Text("会员");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(context) {
    print(' ------ VipPage ------ ');
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
          ),
          Center(
            child: RaisedButton(
              child: Text("Show Bottom Sheet"),
              onPressed: () {
                show();
              },
            ),
          )
        ],
      ),
    );
  }

  void show() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CommentItemView();
        });
  }
}
