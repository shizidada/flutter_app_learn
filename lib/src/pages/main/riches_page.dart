import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/provider/index_provider.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/utils/share_util.dart';
import 'package:flutter_app_learn/src/widgets/comment_Item_view.dart';
import 'package:provider/provider.dart';

/// riches
class RichesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RichesPageState();
}

class _RichesPageState extends State<RichesPage>
    with SingleTickerProviderStateMixin {
  // 初始化
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void show() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CommentItemView();
        });
  }

  @override
  Widget build(BuildContext context) {
    print(' ------ RichesPage ------ ');
    IndexProvider provider = Provider.of<IndexProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(MStrings.richesTitle),
      ),
      body: SafeArea(
        child: Container(
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
              ),
              Center(
                child: RaisedButton(
                  child: Text("Change Badge"),
                  onPressed: () {
                    provider.changeBadge("99", 0);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
