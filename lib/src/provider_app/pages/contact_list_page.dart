import 'package:flutter/material.dart';
import 'package:flutter_app_learn/src/provider_app/res/index.dart';
import 'package:flutter_app_learn/src/provider_app/utils/toast_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:provider/provider.dart';

/// 通讯录
class ContactListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 下拉刷新数据
  Future<Null> _refreshData() async {
    ToastUtil.showToast(message: "TODO：下拉刷新数据");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MStrings.contactTitle),
        elevation: 0.0,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.group_add),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: _buildSlivers(context)),
      ),
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    List<Widget> slivers = List<Widget>();
    int i = 0;
    slivers.add(_buildExample());
    slivers.add(_buildBuilderExample());

    // slivers.add(SliverAppBar(
    //   backgroundColor: Colors.blue.withOpacity(0.5),
    //   title: Text('text'),
    //   pinned: true,
    // ));

    // slivers.add(SliverAppBar(
    //   backgroundColor: Colors.yellow.withOpacity(0.5),
    //   title: Text('text'),
    //   pinned: true,
    // ));

    // slivers.addAll(_buildHeaderBuilderLists(context, i, i += 5));
    // slivers.addAll(_buildLists(context, i, i += 3));
    // slivers.addAll(_buildGrids(context, i, i += 3));
    // slivers.addAll(_buildSideHeaderGrids(context, i, i += 3));
    // slivers.addAll(_buildHeaderBuilderLists(context, i, i += 5));
    return slivers;
  }

  List<Widget> _buildLists(BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return SliverStickyHeader(
        header: _buildHeader(sliverIndex),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => ListTile(
              leading: CircleAvatar(
                child: Text('$sliverIndex'),
              ),
              title: Text('List tile #$i'),
            ),
            childCount: 4,
          ),
        ),
      );
    });
  }

  List<Widget> _buildHeaderBuilderLists(
      BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return SliverStickyHeaderBuilder(
        builder: (context, state) =>
            _buildAnimatedHeader(context, sliverIndex, state),
        sliver: SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, i) => ListTile(
              leading: CircleAvatar(
                child: Text('$sliverIndex'),
              ),
              title: Text('List tile #$i'),
            ),
            childCount: 4,
          ),
        ),
      );
    });
  }

  List<Widget> _buildGrids(BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return SliverStickyHeader(
        header: _buildHeader(sliverIndex),
        sliver: SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          delegate: SliverChildBuilderDelegate(
            (context, i) => GestureDetector(
              onTap: () => Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text('Grid tile #$i'))),
              child: GridTile(
                child: Card(
                  child: Container(
                    color: Colors.green,
                  ),
                ),
                footer: Container(
                  color: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Grid tile #$i',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            childCount: 9,
          ),
        ),
      );
    });
  }

  List<Widget> _buildSideHeaderGrids(
      BuildContext context, int firstIndex, int count) {
    return List.generate(count, (sliverIndex) {
      sliverIndex += firstIndex;
      return SliverStickyHeader(
        overlapsContent: true,
        header: _buildSideHeader(context, sliverIndex),
        sliver: SliverPadding(
          padding: EdgeInsets.only(left: 60.0),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 1.0),
            delegate: SliverChildBuilderDelegate(
              (context, i) => GestureDetector(
                onTap: () => Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Grid tile #$i'))),
                child: GridTile(
                  child: Card(
                    child: Container(
                      color: Colors.orange,
                    ),
                  ),
                  footer: Container(
                    color: Colors.white.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Grid tile #$i',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
              childCount: 12,
            ),
          ),
        ),
      );
    });
  }

  Widget _buildHeader(int index, {String text}) {
    return Container(
      height: 60.0,
      color: Colors.lightBlue,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        text ?? 'Header #$index',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSideHeader(BuildContext context, int index, {String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 44.0,
          width: 44.0,
          child: GestureDetector(
            onTap: () => Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('$index'))),
            child: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.white,
              child: Text('$index'),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedHeader(
      BuildContext context, int index, SliverStickyHeaderState state) {
    return GestureDetector(
      onTap: () =>
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('$index'))),
      child: Container(
        height: 60.0,
        color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            .withOpacity(1.0 - state.scrollPercentage),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          'Header #$index',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildExample() {
    return SliverStickyHeader(
      header: Container(
        height: 60.0,
        color: Colors.lightBlue,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          'Header #0',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            leading: CircleAvatar(
              child: Text('0'),
            ),
            title: Text('List tile #$i'),
          ),
          childCount: 4,
        ),
      ),
    );
  }

  Widget _buildBuilderExample() {
    return SliverStickyHeaderBuilder(
      builder: (context, state) => Container(
        height: 60.0,
        color: (state.isPinned ? Colors.pink : Colors.lightBlue)
            .withOpacity(1.0 - state.scrollPercentage),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          'Header #1',
          style: const TextStyle(color: Colors.white),
        ),
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            leading: CircleAvatar(
              child: Text('0'),
            ),
            title: Text('List tile #$i'),
          ),
          childCount: 4,
        ),
      ),
    );
  }
}
