import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/res/index.dart';
import 'package:flutter_app_learn/src/provider_app/mock/riches_page_mock_data.dart';
import 'package:flutter_app_learn/src/provider_app/provider/index_provider.dart';
import 'package:flutter_app_learn/src/provider_app/utils/navigate_util.dart';
import 'package:flutter_app_learn/src/provider_app/utils/share_util.dart';
import 'package:flutter_app_learn/src/provider_app/widgets/comment_Item_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// riches
class RichesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RichesPageState();
}

class _RichesPageState extends State<RichesPage>
    with SingleTickerProviderStateMixin {
  List<String> listData = [];
  // 初始化
  @override
  void initState() {
    super.initState();
    listData = RichesPageMockData.listData;
  }

  @override
  void dispose() {
    super.dispose();
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
          child: ListView.builder(
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int position) {
          return GestureDetector(
            onTap: () {
              listTileItemClick(context, position, provider);
            },
            child: ListTile(
              title: Text(
                listData[position],
                style: TextStyle(fontSize: ScreenUtil().setSp(38.0)),
              ),
            ),
          );
        },
      )),
    );
  }

  void listTileItemClick(
      BuildContext context, int position, IndexProvider provider) {
    switch (position) {
      case 0:
        SharedUtil.clear();
        break;
      case 1:
        NavigatorUtil.pushFromRight(context, "/video");
        break;
      case 2:
        show();
        break;
      case 3:
        provider.changeBadge("99", 0);
        break;
      case 4:
        NavigatorUtil.pushFromRight(context, "/keyboardActionsPage");
        break;
      case 5:
        NavigatorUtil.pushFromRight(context, "/netease/music/index/page");
        break;
      default:
    }
  }

  void show() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return CommentItemView();
        });
  }
}
