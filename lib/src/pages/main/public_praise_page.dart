import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/base/base_page.dart';
import 'package:flutter_app_learn/src/config/index.dart';

/// public praise
class PublicPraisePage extends BasePage {
  @override
  State<StatefulWidget> createState() => _PublicPraisePageState();
}

class _PublicPraisePageState<PublicPraisePage> extends BasePageState
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    title = Text(MStrings.publicPraiseTitle);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(context) {
    print(' ------ PublicPraisePage ------ ');
    return Text("PublicPraisePage");
  }
}
