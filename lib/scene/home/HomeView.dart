
import 'package:flutter/material.dart';
import 'package:luobo_app/views/FeedListView.dart';
import 'package:luobo_app/views/NavigationBar.dart';

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
        appBar: NavigationBar(
          title: "郑州市",
        ),
        body: FeedListView(),
      ),
    );
  }
}