import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/screens/category/category_content_view.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/vertical_tabs.dart';

class ATHCategoryBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: VerticalTabs(
                tabsWidth: 180.px,
                initialIndex: 0,
                contentScrollAxis: Axis.vertical,
                indicatorColor: Colors.transparent,
                selectedTabBackgroundColor: ATHColors.primaryLightColor,
                disabledChangePageFromContentView: true,
                tabTextStyle: TextStyle(color: ATHColors.color66),
                selectedTabTextStyle: TextStyle(color: ATHColors.color33),
                tabs: <Tab>[
                  Tab(text: "Flutter"),
                  Tab(text: "Dart"),
                  Tab(text: "Java"),
                ],
                contents: <Widget>[
                  ATHCategoryContentView(categoryType: 'Flutter'),
                  ATHCategoryContentView(categoryType: 'Dart'),
                  ATHCategoryContentView(categoryType: 'Java'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
