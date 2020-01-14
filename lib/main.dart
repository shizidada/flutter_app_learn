import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_learn/src/netease_music/pages/netesase_music_index_page.dart';
import 'package:flutter_app_learn/src/pages/index_page.dart';
import 'package:flutter_app_learn/src/pages/login_page.dart';
import 'package:flutter_app_learn/src/provider/comment_provider.dart';
import 'package:provider/provider.dart';

import 'src/provider/index_provider.dart';
import 'src/provider/friends_provider.dart';
import 'src/provider/home_provider.dart';

import 'src/pages/welcome_page.dart';
import 'src/routers/application.dart';
import 'src/routers/routers.dart';

import 'src/config/index.dart';

import 'package:flutter_app_learn/src/pages/register_page.dart';
import 'package:flutter_app_learn/src/provider/favorite_provider.dart';

void main() async {
  runApp(MooseApp());
}

class MooseApp extends StatelessWidget {
  MooseApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
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
          create: (context) => FriendsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommentProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Moose',
        // debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: MColors.alipayColor),
        // color: MColors.alipayColor,
        home: NeteaseMusicIndexPage(),
        // home: WelcomePage(),
        onGenerateRoute: Application.router.generator,
        // localizationsDelegates: [
        //   // 国际化
        //   FlutterI18nDelegate(
        //       useCountryCode: true,
        //       fallbackFile: 'zh_CN',
        //       path: 'assets/locale'),
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate
        // ],
      ),
    );
  }
}
