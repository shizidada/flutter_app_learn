import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/screens/message/message_item.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ATHNestedScrollModalContent extends StatelessWidget {
  final ScrollController scrollController;

  const ATHNestedScrollModalContent({Key key, this.scrollController}) : super(key: key);

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
                  Container(height: 300.h, color: ATHColors.primaryColor),
                ],
              ),
            ),
          ];
        },
        body: ATHGlobalContainerWrapper(
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
