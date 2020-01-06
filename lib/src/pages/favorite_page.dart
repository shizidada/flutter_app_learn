import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page_state.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

/// 关注
class FavoritePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  _FavoritePageState() {
    title = Text('关注');
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget buildBody(context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    double width = ScreenUtil.screenWidth;
    double height = ScreenUtil.screenHeight;
    print("$width, $height");
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(80.0),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().setWidth(8.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('1'),
                Text('2'),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                controller: _scrollController,
                crossAxisCount: 4,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) => Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text('$index'),
                      ),
                    )),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 2 : 1),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
              onRefresh: _refreshData,
            ),
          )
        ],
      ),
    );
  }

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    ToastUtil.showToast(message: "TODO：下拉刷新数据");
  }
}
