import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/netease_music_app/routers/routers.dart';
import 'package:flutter_app_learn/src/netease_music_app/routers/application.dart';
import 'package:flutter_app_learn/src/netease_music_app/providers/netease_music_provider.dart';
import 'package:flutter_app_learn/src/netease_music_app/pages/netesase_music_index_page.dart';
import 'package:provider/provider.dart';

class MusicApp extends StatelessWidget {
  MusicApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MusicContainer();
  }
}

class MusicContainer extends StatelessWidget {
  const MusicContainer({Key key}) : super(key: key);

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
          create: (context) => NeteaseMusicProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter App Learn',
        // debugShowCheckedModeBanner: false,
        home: NeteaseMusicIndexPage(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
