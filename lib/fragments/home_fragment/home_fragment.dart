import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/github_view.dart';

class HomeFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

// 创建 Tab
  Tab _createTab(icon) {
    return Tab(
      icon: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        bottom: TabBar(
          tabs: <Widget>[
            _createTab(Icons.settings_ethernet),
            _createTab(Icons.strikethrough_s),
            _createTab(Icons.cloud_queue),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: GithubView()),
          Center(child: Text('GitLab')),
          Center(child: Text('BitBucket')),
        ],
      ),
    );
  }
}
