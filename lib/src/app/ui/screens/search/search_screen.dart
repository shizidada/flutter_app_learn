import 'package:flutter/material.dart';

import 'search_app_bar_title.dart';
import 'search_content.dart';

class ATHSearchScreen extends StatelessWidget {
  static final String routeName = "app://search";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchAppBar(),
      body: ATHSearchContent(),
    );
  }

  AppBar buildSearchAppBar() => AppBar(
        automaticallyImplyLeading: false,
        title: ATHSearchAppBarTitle(),
      );
}
