import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {}

abstract class BasePageState<T extends BasePage> extends State<T>
    with AutomaticKeepAliveClientMixin {
  Widget title;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: title,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(context);

  @override
  bool get wantKeepAlive => true;
}
