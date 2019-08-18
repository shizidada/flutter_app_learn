import 'package:flutter/material.dart';
import 'package:flutter_app_learn/base/base_page_state.dart';
import 'package:flutter_app_learn/utils/share_util.dart';

/// 关注
class FavoritePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  _FavoritePageState() {
    title = Text('关注');
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
  Widget buildBody() {
    return Container(
      child: Center(
        child: RaisedButton(
          child: Text("clear"),
          onPressed: () {
            SharedUtil.clear();
          },
        ),
      ),
    );
  }
}
