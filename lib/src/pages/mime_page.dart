import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page_state.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 我
class MimePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _MimePageState();
}

class _MimePageState<MimePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  _MimePageState() {
    title = Text(
      '我的',
    );
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // double width = ScreenUtil.screenWidth;
    // double height = ScreenUtil.screenHeight;
    return Container(child: Text('MimePage'));
  }
}
