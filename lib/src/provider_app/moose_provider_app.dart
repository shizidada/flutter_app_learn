import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/res/colors.dart';
import 'package:flutter_app_learn/src/provider_app/pages/main/home_page.dart';
import 'package:flutter_app_learn/src/provider_app/provider/chat_provider.dart';
import 'package:flutter_app_learn/src/provider_app/provider/comment_provider.dart';
import 'package:flutter_app_learn/src/provider_app/provider/favorite_provider.dart';
import 'package:flutter_app_learn/src/provider_app/provider/home_provider.dart';
import 'package:flutter_app_learn/src/provider_app/provider/index_provider.dart';
import 'package:flutter_app_learn/src/provider_app/provider/netease_music_provider.dart';
import 'package:flutter_app_learn/src/provider_app/routers/application.dart';
import 'package:flutter_app_learn/src/provider_app/routers/routers.dart';
import 'package:provider/provider.dart';

class MooseProviderApp extends StatelessWidget {
  MooseProviderApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MooseProviderContainer();
  }
}

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
        home: HomePage(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
