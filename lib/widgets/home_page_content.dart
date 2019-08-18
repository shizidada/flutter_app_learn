import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_learn/utils/navigate_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePageContent extends StatefulWidget {
  HomePageContent({this.parentContext, @required this.title});

  final BuildContext parentContext;

  final String title;

  @override
  State<StatefulWidget> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent>
    with AutomaticKeepAliveClientMixin {
  List<Widget> _imageList = List();

  @override
  void initState() {
    _imageList
      ..add(Image.asset(
        'assets/images/1.jpeg',
        fit: BoxFit.cover,
      ))
      ..add(Image.asset(
        'assets/images/2.jpeg',
        fit: BoxFit.cover,
      ))
      ..add(Image.asset(
        'assets/images/3.jpeg',
        fit: BoxFit.cover,
      ))
      ..add(Image.asset(
        'assets/images/4.jpeg',
        fit: BoxFit.cover,
      ));
    super.initState();
    print("initState ... " + widget.title);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    String title = widget.title;

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (contxt, index) {
                if (index == 0) {
                  return firstSwiperView();
                }
                return Card(
                  child: ListTile(
                    leading: Icon(Icons.book),
                    trailing: Icon(Icons.message),
                    title: Text("$title $index"),
                    subtitle: Text("1234567890"),
                    onTap: () {
                      NavigatorUtil.pushFromRight(
                          widget.parentContext, "/detail/$index/$title/江景");
                    },
                    // isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget firstSwiperView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Swiper(
        itemCount: 4,
        itemBuilder: _swiperBuilder,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.black54, activeColor: Colors.white)),
        controller: SwiperController(),
        scrollDirection: Axis.horizontal,
        // autoplay: true,
        onTap: (index) => print('点击了第$index'),
      ),
    );
  }

  Widget _swiperBuilder(BuildContext context, int index) {
    return _imageList[index];
  }

  @override
  bool get wantKeepAlive => true;
}
