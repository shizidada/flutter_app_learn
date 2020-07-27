import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/home_mock_data.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/density.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/navigate_util.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /**
      BlocBuilder<HomeBloc, int>(builder: (_, counter) {
        return Text('Home Bloc of Data $counter');
      }),
      BlocBuilder<DetailBloc, int>(builder: (_, counter) {
        return Text('Detail Bloc of Data $counter');
      }),
     */
    /// todo:
    Density.instance.init(context, 750, 750);
    List<HomeMockBean> homeLists = HomeMockUtils.homeLists;
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text('Home Screen'),
        ),
        body: ListView.builder(
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
                )));
  }
}
