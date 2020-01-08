import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/models/user_info_model.dart';
import 'package:flutter_app_learn/src/provider/friends_provider.dart';
import 'package:flutter_app_learn/src/utils/navigate_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/// Friends
class FriendsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

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
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    double width = ScreenUtil.screenWidth;
    double height = ScreenUtil.screenHeight;
    print(" ------ FriendsPage $width, $height ------ ");
    FriendsProvider provider = Provider.of<FriendsProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(MStrings.friendTitle),
          elevation: 0.0,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.supervisor_account),
              color: Colors.white,
              onPressed: () {
                NavigatorUtil.pushFromRight(context, '/contact/list');
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {},
            )
          ],
        ),
        body: Container(
            child: Column(
          children: <Widget>[_buildSearch(), _buildFriendList(provider)],
        )),
      ),
    );
  }

  Widget _buildFriendList(FriendsProvider provider) {
    List<UserInfoModel> friendsList = provider.friendsList;

    return Expanded(
      child: ListView.builder(
        itemCount: friendsList.length,
        itemBuilder: (_, index) {
          UserInfoModel friends = friendsList[index];
          return GestureDetector(
            onTap: () {
              NavigatorUtil.pushFromRight(
                  context, "/chat/${friends.userId}/${friends.username}");
            },
            child: ListTile(
              leading: CachedNetworkImage(
                imageUrl: friends.avatar,
              ),
              title: Text(friends.username),
              subtitle: Text(friends.description),
              trailing: Text(friends.gender == null ? "" : friends.gender),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.all(ScreenUtil.getInstance().setWidth(16.0)),
          hintText: "几多风雨 ...",
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            borderSide: BorderSide(
              color: Colors.grey, //边线颜色为黄色
              width: 0.5, //边线宽度为2
            ),
          ),
          prefixIcon: Icon(Icons.search)),
    );
  }
}
