import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/config/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 我
class MimePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MimePageState();
}

class _MimePageState extends State<MimePage>
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
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // double width = ScreenUtil.screenWidth;
    // double height = ScreenUtil.screenHeight;
    print(" ------ MimePage ------ ");
    return Scaffold(
      appBar: AppBar(
        title: Text(MStrings.publicPraiseTitle),
      ),
      body: SafeArea(
        child: Container(child: Text('MimePage')),
      ),
    );
  }
}
