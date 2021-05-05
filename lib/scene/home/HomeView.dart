import 'package:flutter/material.dart';
import 'package:luobo_app/views/FeedListView.dart';
import 'package:luobo_app/views/NavigationBar.dart';
import 'package:luobo_app/views/NavigationBarButtonItem.dart';

class HomeView extends StatefulWidget {
  @override
  HomeView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
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
        body: FeedListView(),
      ),
    );
  }
}
