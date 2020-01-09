import 'package:flutter/material.dart';

abstract class BasePage extends StatefulWidget {}

abstract class BasePageState<T extends BasePage> extends State<T>
    with AutomaticKeepAliveClientMixin {
  Widget title = Text("Default Title");

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: title,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context);

  @override
  bool get wantKeepAlive => true;
}
