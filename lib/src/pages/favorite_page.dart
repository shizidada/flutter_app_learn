import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page_state.dart';
import 'package:flutter_app_learn/src/models/favorite_item_info.dart';
import 'package:flutter_app_learn/src/provider/favorite_provider.dart';
import 'package:flutter_app_learn/src/utils/toast_util.dart';
import 'package:flutter_app_learn/src/widgets/favorite_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

/// 关注
class FavoritePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    title = Text('关注');
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
    print(" ------ FavoritePage $width, $height ------ ");
    FavoriteProvider provider = Provider.of<FavoriteProvider>(context);
    provider.getFavorateInfos();
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getInstance().setHeight(80.0),
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setWidth(8.0)),
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
              child: Container(
                padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setWidth(8.0),
                    right: ScreenUtil.getInstance().setWidth(8.0)),
                child: StaggeredGridView.countBuilder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  crossAxisCount: 4,
                  itemCount: provider.favorites.length,
                  itemBuilder: (BuildContext context, int index) =>
                      FavoriteItem(
                    favoriteInfo: provider.favorites[index],
                  ),
                  staggeredTileBuilder: (int index) =>
                      StaggeredTile.count(2, index.isEven ? 3 : 2.5),
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
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
