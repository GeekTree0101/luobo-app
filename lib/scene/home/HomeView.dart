import 'package:flutter/material.dart';
import 'package:luobo_app/scene/home/HomeModel.dart';
import 'package:luobo_app/views/FABView.dart';
import 'package:luobo_app/views/FeedArticleView.dart';
import 'package:luobo_app/views/FeedListAdapterView.dart';
import 'package:luobo_app/views/NavigationBarButtonItem.dart';
import 'package:luobo_app/views/RegionControlNavigationBar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  HomeView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeView> {

  RefreshController _refreshController;

  @override
  void initState() {
    _refreshController = RefreshController(
      initialRefresh: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: RegionControlNavigationBar(
          title: "郑州市",
          barButtonItems: [
            NavigationBarButtonItem(
              icon: Icons.search,
              onPressed: () {
                // TBD
              },
            ),
            NavigationBarButtonItem(
              icon: Icons.notifications_none,
              onPressed: () {
                // TBD
              },
            ),
          ],
        ),
        body: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Stack(
      children: [
        _feedList(context),
        _floatingActionButton(context),
      ],
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return Positioned(
      bottom: 12.0,
      right: 12.0,
      child: FABView(name: "写作"),
    );
  }

  Widget _feedList(BuildContext context) {
    final homeModel = context.watch<HomeModel>();

    return FeedListAdapterView(
      refreshController: _refreshController,
      onLoading: () async {
        try {
          await homeModel.reload();
          this._refreshController.loadComplete();
        } catch (error) {
          this._refreshController.loadFailed();
        }
      },
      onRefreshing: () async {
        try {
          await homeModel.reload();
          this._refreshController.refreshCompleted();
        } catch (error) {
          this._refreshController.refreshFailed();
          print(error);
        }
      },
      onNext: () async {
        try {
          await homeModel.next();
        } catch (error) {
          // TODO: show error
          print(error);
        }
      },
      shouldBatch: () {
        return homeModel.shouldBatch();
      },
      child: ListView.builder(
        itemCount: homeModel.itemViewModels.length,
        itemBuilder: (context, index) {
          return FeedArticleView(
            viewModel: homeModel.itemViewModels[index],
          );
        },
      ),
    );
  }
}
