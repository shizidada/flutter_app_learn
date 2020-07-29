import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/home_mock_data.dart';
import 'package:nine_grid_view/nine_grid_view.dart';
import 'package:flutter_app_learn/src/bloc_app/utils/image_util.dart';
import 'package:flutter_app_learn/src/bloc_app/mocks/image_bean.dart';

class DragSortScreen extends StatefulWidget {
  @override
  _DragSortScreenState createState() => _DragSortScreenState();
}

class _DragSortScreenState extends State<DragSortScreen> {
  List<ImageBean> imageList = List();
  int moveAction = MotionEvent.actionUp;
  bool _canDelete = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() {
    imageList = HomeMockUtils.getTestData();
  }

  void _loadAssets(BuildContext context) {
    // pick Images.
    ImageUtil.showSnackBar(context, "pick Images.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DragSortView'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                setState(() {
                  _init();
                });
              }),
        ],
      ),
      body: ListView(
        children: <Widget>[
          DragSortView(
            imageList,
            space: 5,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(0),
            itemBuilder: (BuildContext context, int index) {
              ImageBean bean = imageList[index];
              // It is recommended to use a thumbnail picture
              return ImageUtil.getWidget(bean.thumbPath);
            },
            initBuilder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  _loadAssets(context);
                },
                child: Container(
                  color: Color(0XFFCCCCCC),
                  child: Center(
                    child: Icon(
                      Icons.add,
                    ),
                  ),
                ),
              );
            },
            onDragListener: (MotionEvent event, double itemWidth) {
              switch (event.action) {
                case MotionEvent.actionDown:
                  moveAction = event.action;
                  setState(() {});
                  break;
                case MotionEvent.actionMove:
                  double x = event.globalX + itemWidth;
                  double y = event.globalY + itemWidth;
                  double maxX = MediaQuery.of(context).size.width - 1 * 100;
                  double maxY = MediaQuery.of(context).size.height - 1 * 100;
                  print('Sky24n maxX: $maxX, maxY: $maxY, x: $x, y: $y');
                  if (_canDelete && (x < maxX || y < maxY)) {
                    setState(() {
                      _canDelete = false;
                    });
                  } else if (!_canDelete && x > maxX && y > maxY) {
                    setState(() {
                      _canDelete = true;
                    });
                  }
                  break;
                  break;
                case MotionEvent.actionUp:
                  moveAction = event.action;
                  if (_canDelete) {
                    setState(() {
                      _canDelete = false;
                    });
                    return true;
                  } else {
                    setState(() {});
                  }
                  break;
              }
              return false;
            },
          ),
        ],
      ),
      floatingActionButton: moveAction == MotionEvent.actionUp
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(_canDelete ? Icons.delete : Icons.delete_outline),
            ),
    );
  }
}
