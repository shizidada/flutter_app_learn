import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class FlutterSlidableScreen extends StatelessWidget {
  const FlutterSlidableScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Slidable"),
        ),
        body: _buildListView(context));
  }

  Widget _buildListView(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Slidable(
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigoAccent,
                child: Text('11'),
                foregroundColor: Colors.white,
              ),
              title: Text('Tile 22'),
              subtitle: Text('SlidableDrawerDelegate'),
            ),
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
      itemCount: 1,
    );
  }

  void _showSnackBar(type) {
    print(type);
  }
}
