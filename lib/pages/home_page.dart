import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/provider/current_index_provide.dart';
import 'package:flutter_app_learn/routers/application.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';

/// 主页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return Column(children: <Widget>[
      Container(
          height: 250.0,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                color: Colors.cyan,
                child: Image.network(
                  "http://img.zcool.cn/community/01ed9c55499c160000019ae993c9a4.jpg@2o.jpg",
                  fit: BoxFit.fitWidth,
                ),
              );
            },
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            // loop: true,
            duration: 300,
            // autoplay: true,
            onIndexChanged: (index) {
              debugPrint("index:$index");
            },
            onTap: (index) {
              debugPrint("点击了第:$index个");
            },
//                control:SwiperControl(),
            pagination: SwiperPagination(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(bottom: 20.0, right: 20.0),
                builder: SwiperPagination.fraction),
//                autoplayDelay: 3000,
            // autoplayDisableOnInteraction: true
          ))
    ]);
  }
}

// children: <Widget>[
//               RaisedButton(
//                 child: Text("detail"),
//                 onPressed: () {
//                   Application.router.navigateTo(context, "/login",
//                       transition: TransitionType.inFromRight);
//                 },
//               ),
//               Text("$currentIndex")
//             ]
