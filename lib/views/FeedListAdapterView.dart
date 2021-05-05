import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FeedListAdapterView extends StatelessWidget {

  RefreshController refreshController;
  Function() onLoading;
  Function() onRefreshing;
  bool Function() shouldBatch;
  Function() onNext;
  ListView child;

  FeedListAdapterView({
    this.refreshController,
    this.onLoading,
    this.onRefreshing,
    this.shouldBatch,
    this.onNext,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return _batchable(
      context,
      _scrollable(
        _refreshable(
          context,
          child,
        ),
      ),
    );
  }

  Widget _batchable(BuildContext context, Widget child) {
    return NotificationListener(
      child: child,
      onNotification: (notification) {
        if (this._reachToBottom(notification)) {
          if (this.shouldBatch()) {
            this.onNext();
          }
        }
      },
    );
  }

  Widget _refreshable(BuildContext context, Widget child) {
    return SmartRefresher(
      controller: this.refreshController,
      enablePullDown: true,
      enablePullUp: false,
      header: ClassicHeader(
        idleText: "drag more",
        completeText: "success!",
        failedText: "failed :[",
        refreshingText: "refreshing...",
      ),
      onLoading: () {
        this.onLoading();
      },
      onRefresh: () {
        this.onRefreshing();
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

  bool _reachToBottom(dynamic notification) {
    if (notification is ScrollNotification) {
      final ScrollNotification scrollNotification = notification;
      return scrollNotification.metrics.pixels ==
          scrollNotification.metrics.maxScrollExtent;
    }

    return false;
  }
}
