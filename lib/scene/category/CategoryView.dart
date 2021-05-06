
import 'package:flutter/material.dart';
import 'package:luobo_app/scene/category/CategoryModel.dart';
import 'package:luobo_app/scene/category/components/CategoryItemView.dart';
import 'package:luobo_app/views/FeedListAdapterView.dart';
import 'package:luobo_app/views/NavigationBar.dart';
import 'package:luobo_app/views/NavigationBarButtonItem.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CategoryView extends StatefulWidget {
  @override
  CategoryView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<CategoryView> {

  RefreshController _refreshController;

  @override
  void initState() {
    this._refreshController = RefreshController(
      initialRefresh: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          title: "分类",
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
        body: _categoryList(context),
      ),
    );
  }

  Widget _categoryList(BuildContext context) {

    final categoryModel = context.watch<CategoryModel>();

    return FeedListAdapterView(
      refreshController: _refreshController,
      onLoading: () async {
        try {
          await categoryModel.fetch();
          _refreshController.loadComplete();
        } catch(error) {
          // TODO: show error
          _refreshController.loadFailed();
        }
      },
      onRefreshing: () async {
        try {
          await categoryModel.fetch();
          _refreshController.refreshCompleted();
        } catch(error) {
          // TODO: show error
          _refreshController.refreshFailed();
        }
      },
      shouldBatch: () => false,
      child: ListView.builder(
        itemCount: categoryModel.items.length,
        itemBuilder: (context, index) {
          return CategoryItemView(
            viewModel: categoryModel.items[index],
          );
        },
      ),
    );
  }
}