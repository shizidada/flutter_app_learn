import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';
import 'package:flutter_app_learn/src/provider/chat_provider.dart';
import 'package:flutter_app_learn/src/provider/comment_provider.dart';
import 'package:flutter_app_learn/src/provider/favorite_provider.dart';
import 'package:flutter_app_learn/src/provider/home_provider.dart';
import 'package:flutter_app_learn/src/provider/index_provider.dart';
import 'package:flutter_app_learn/src/provider/netease_music_provider.dart';
import 'package:flutter_app_learn/src/routers/application.dart';
import 'package:flutter_app_learn/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

class MooseProviderContainer extends StatelessWidget {
  const MooseProviderContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildWithProvider(context),
    );
  }

  Widget buildWithProvider(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => IndexProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NeteaseMusicProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter App Learn',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: MColors.alipayColor),
        // home: NeteaseMusicIndexPage(),
        home: HomeScreen(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
