import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/core/utils/navigator_util.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/colors.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_app_learn/src/app/core/extension/num_extension.dart';

import 'message_item.dart';


class ATHMessageModalContent extends StatelessWidget {
  final ScrollController scrollController;

  const ATHMessageModalContent({Key key, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ATHScrollerConfigurationWrapper(
          child: NestedScrollView(
            controller: ScrollController(),
            physics: ScrollPhysics(parent: PageScrollPhysics()),
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 300.px,
                        color: ATHColors.primaryColor,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    ATHNavigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.all(16.px),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.px),
              child: ListView.builder(
                controller: scrollController,
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: ATHMessageItem(),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Archive',
                        color: Colors.blue,
                        icon: Icons.archive,
                        onTap: () => _showSnackBar('Archive'),
                      ),
                      IconSlideAction(
                        caption: 'Share',
                        color: Colors.indigo,
                        icon: Icons.share,
                        onTap: () => _showSnackBar('Share'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'More',
                        color: Colors.black45,
                        icon: Icons.more_horiz,
                        onTap: () => _showSnackBar('More'),
                      ),
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        onTap: () => _showSnackBar('Delete'),
                      ),
                    ],
                  );
                },
                itemCount: 6,
              ),
            ),
          ),
        ));
  }

  void _showSnackBar(type) {
    print(type);
  }
}
