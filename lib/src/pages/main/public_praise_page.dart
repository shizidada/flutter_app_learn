import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/index.dart';

/// public praise
class PublicPraisePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PublicPraisePageState();
}

class _PublicPraisePageState extends State<PublicPraisePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(' ------ PublicPraisePage ------ ');
    return Scaffold(
      appBar: AppBar(
        title: Text(MStrings.publicPraiseTitle),
      ),
      body: SafeArea(
        child: Text(MStrings.publicPraiseTitle),
      ),
    );
  }
}
