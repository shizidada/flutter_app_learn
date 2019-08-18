import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_app_learn/base/base_page_state.dart';
import 'package:flutter_app_learn/widgets/sample_list_item.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// Vip
class VipPage extends BasePage {
  @override
  State<StatefulWidget> createState() => _VipPageState();
}

class _VipPageState<BasePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  _VipPageState() {
    title = Text("Vip 会员");
  }
  // 总数
  int _count = 0;

  // 初始化
  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((Duration timestamp) {
      // 设置EasyRefresh的默认样式
      EasyRefresh.defaultHeader = ClassicalHeader(
        enableInfiniteRefresh: false,
        refreshText: FlutterI18n.translate(context, 'pullToRefresh'),
        refreshReadyText: FlutterI18n.translate(context, 'releaseToRefresh'),
        refreshingText: FlutterI18n.translate(context, 'refreshing'),
        refreshedText: FlutterI18n.translate(context, 'refreshed'),
        refreshFailedText: FlutterI18n.translate(context, 'refreshFailed'),
        noMoreText: FlutterI18n.translate(context, 'noMore'),
        infoText: FlutterI18n.translate(context, 'updateAt'),
      );
      EasyRefresh.defaultFooter = ClassicalFooter(
        enableInfiniteLoad: true,
        loadText: FlutterI18n.translate(context, 'pushToLoad'),
        loadReadyText: FlutterI18n.translate(context, 'releaseToLoad'),
        loadingText: FlutterI18n.translate(context, 'loading'),
        loadedText: FlutterI18n.translate(context, 'loaded'),
        loadFailedText: FlutterI18n.translate(context, 'loadFailed'),
        noMoreText: FlutterI18n.translate(context, 'noMore'),
        infoText: FlutterI18n.translate(context, 'updateAt'),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody() {
    return EasyRefresh.custom(
      firstRefresh: true,
      firstRefreshWidget: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
            child: SizedBox(
          height: 200.0,
          width: 300.0,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitFadingCube(
                    color: Theme.of(context).primaryColor,
                    size: 25.0,
                  ),
                ),
                Container(
                  child: Text(FlutterI18n.translate(context, 'loading')),
                )
              ],
            ),
          ),
        )),
      ),
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return SampleListItem();
            },
            childCount: _count,
          ),
        ),
      ],
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _count = 20;
          });
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _count += 20;
          });
        });
      },
    );
  }
}
