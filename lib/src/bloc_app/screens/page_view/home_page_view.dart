import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/home_mock_data.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/navigate_util.dart';

// with AutomaticKeepAliveClientMixin

class HomePageView extends StatefulWidget {
  HomePageView({Key key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with AutomaticKeepAliveClientMixin {

  @override
  Widget build(BuildContext context) {
    List<HomeMockBean> homeLists = HomeMockUtils.homeLists;

    return ListView.builder(
        itemCount: homeLists.length,
        itemBuilder: (_, index) => GestureDetector(
              onTap: () {
                NavigatorUtil.pushFromRight(context, homeLists[index].path);
              },
              child: Column(children: <Widget>[
                ListTile(
                  title: Text(homeLists[index].name),
                ),
                Divider()
                // Drivier();
              ]),
            ));
  }

  @override
  bool get wantKeepAlive => true;
}
