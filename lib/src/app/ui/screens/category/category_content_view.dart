import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ATHCategoryContentView extends StatefulWidget {
  final String categoryType;

  ATHCategoryContentView({this.categoryType});

  @override
  _ATHCategoryContentViewState createState() => _ATHCategoryContentViewState();
}

class _ATHCategoryContentViewState extends State<ATHCategoryContentView>
    with AutomaticKeepAliveClientMixin {
  int _count = 6;

  @override
  void initState() {
    super.initState();
    print(widget.categoryType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 2), () {
          print('onRefresh');
          setState(() {
            _count = 6;
          });
        });
      },
      onLoad: () async {
        await Future.delayed(Duration(seconds: 2), () {
          print('onLoad');
          setState(() {
            _count += 2;
          });
        });
      },
      header: PhoenixHeader(),
      footer: PhoenixFooter(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: _count,
        itemBuilder: (context, index) {
          return Slidable(
            actionPane: SlidableDrawerActionPane(),
            actionExtentRatio: 0.25,
            child: ListTile(
              title: Text("哈哈哈 哈哈哈"),
            ),
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
      ),
    );
  }

  void _showSnackBar(type) {
    print(type);
  }

  @override
  bool get wantKeepAlive => true;
}
