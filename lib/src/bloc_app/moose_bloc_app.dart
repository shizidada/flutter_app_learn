import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/detail_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/home_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/login/login_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/blocs/theme_bloc.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/application.dart';
import 'package:flutter_app_learn/src/bloc_app/routers/routers.dart';
import 'package:flutter_app_learn/src/bloc_app/res/colors.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/home_screen.dart';
import 'package:flutter_app_learn/src/bloc_app/screens/sqflite_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_i18n/flutter_i18n.dart';

class MooseBlocApp extends StatelessWidget {
  MooseBlocApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => ThemeBloc(),
        ),
        BlocProvider(
          create: (_) => DetailBloc(),
        ),
      ],
      child: MooseBlocContainer(),
    );
  }
}

class MooseBlocContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(detailBloc: BlocProvider.of<DetailBloc>(context)),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            title: 'Flutter App Learn',
            theme: ThemeData(primaryColor: MColors.kPrimaryColor),
            home: HomeScreen(),
            // home: SqfliteScreen(),
            onGenerateRoute: Application.router.generator,

            /// i18n
            // localizationsDelegates: [
            //   FlutterI18nDelegate(
            //     translationLoader: FileTranslationLoader(),
            //     missingTranslationHandler: (key, locale) {
            //       print(
            //           "--- Missing Key: $key, languageCode: ${locale.languageCode}");
            //     },
            //   ),
            // ]
          );
        },
      ),
    );
  }
}
