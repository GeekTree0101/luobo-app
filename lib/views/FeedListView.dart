import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luobo_app/views/FeedArticleView.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedListView extends StatefulWidget {
  @override
  FeedListView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FeedListState();
}

class FeedListState extends State<FeedListView> {
  RefreshController _refreshController;

  @override
  void initState() {
    this._refreshController = RefreshController(
      initialRefresh: false,
      initialLoadStatus: LoadStatus.loading,
      initialRefreshStatus: RefreshStatus.idle,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _scrollable(
      _refreshable(
        context,
        _list(context),
      ),
    );
  }

  Widget _refreshable(BuildContext context, Widget child) {
    return SmartRefresher(
      controller: this._refreshController,
      enablePullDown: true,
      enablePullUp: false,
      header: ClassicHeader(
        idleText: "drag more",
        completeText: "success!",
        failedText: "failed :[",
        refreshingText: "refreshing...",
      ),
      onLoading: () {
        // TODO:
      },
      onRefresh: () {
        // TODO:
      },
      child: child,
    );
  }

  Widget _scrollable(Widget child) {
    if (Platform.isIOS) {
      return CupertinoScrollbar(child: child);
    } else {
      return Scrollbar(child: child);
    }
  }

  Widget _list(BuildContext context) {
    return ListView.builder(
      itemCount: 0, // TODO : count
      itemBuilder: (context, index) {
        // TODO : tap
        return FeedArticleView();
      },
    );
  }
}
