import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/global_container_wrapper.dart';
import 'package:flutter_app_learn/src/app/ui/widgets/scroll/scroller_configuration_wrapper.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'widgets/message_item.dart';
import 'widgets/message_modal_content.dart';

class ATHMessageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ATHGlobalContainerWrapper(
      child: ATHScrollerConfigurationWrapper(
        child: buildListView(),
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
          ATHMessageModalContent(scrollController: scrollController),
    );
    print('object $index');
  }
}
