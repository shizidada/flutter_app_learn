import 'package:flutter_app_learn/src/bloc_app/mocks/image_bean.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/routers.dart';

class HomeMockBean {
  String name;

  String path;

  HomeMockBean(this.name, this.path);
}

class HomeMockUtils {
  static List<HomeMockBean> homeLists = [
    HomeMockBean('自定义 Sheet', Routes.customBottomSheetScreen),
    HomeMockBean('Login', Routes.loginScreen),
    HomeMockBean('Sliver', Routes.sliverScreen),
    HomeMockBean('StaggeredGridView', Routes.staggeredGridViewScreen),
    HomeMockBean('NineGridView', Routes.nineGridViewScreen),
    HomeMockBean('CachedNetworkImage', Routes.cachedNetworkImageScreen),
    HomeMockBean('Flutter Toast', Routes.flutterToastScreen),
    HomeMockBean('Flutter i18n', Routes.flutteri18nScreen),
    HomeMockBean('Flutter EasyRefresh', Routes.flutterEasyRefreshScreen),
    HomeMockBean('ConvexAppBar', Routes.convexAppBarScreen),
    HomeMockBean('Flutter Slidable', Routes.flutterSlidableScreen),
  ];

  static List<ImageBean> getTestData() {
    List<String> urlList = [
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
      'avatar',
    ];
    List<ImageBean> list = List();
    for (int i = 0; i < urlList.length; i++) {
      String url = urlList[i];
      list.add(ImageBean(
        originPath: url,
        middlePath: url,
        thumbPath: url,
        originalWidth: i == 0 ? 264 : null,
        originalHeight: i == 0 ? 258 : null,
      ));
    }
    return list;
  }
}
