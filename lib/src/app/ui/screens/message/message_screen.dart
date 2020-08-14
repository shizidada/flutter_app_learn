import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/res/values/values.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'message_item.dart';

class ATHMessageScreen extends StatelessWidget {
  static final String routeName = "app://message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: ATHGlobalContainerWrapper(
        child: ATHScrollerConfigurationWrapper(
          child: buildListView(),
        ),
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return ATHMessageItem(
          onMessageItemClick: () {
            handleListItemClick(ctx, index);
          },
        );
      },
    );
  }

  void handleListItemClick(context, index) {
    showCupertinoModalBottomSheet(
//      expand: true,
      context: context,
      builder: (context, scrollController) =>
          NestedScrollModal(scrollController: scrollController),
    );
    print('object $index');
  }
}

class NestedScrollModal extends StatelessWidget {
  final ScrollController scrollController;

  const NestedScrollModal({Key key, this.scrollController}) : super(key: key);

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
                  Container(height: 300.h, color: ATHColors.primaryLightColor),
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
