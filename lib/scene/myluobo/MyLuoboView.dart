import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luobo_app/views/NavigationBar.dart';
import 'package:luobo_app/views/NavigationBarButtonItem.dart';

class MyLuoboView extends StatefulWidget {
  MyLuoboView({Key key}) : super(key: key);

  @override
  _MyLuoboViewState createState() => _MyLuoboViewState();
}

class _MyLuoboViewState extends State<MyLuoboView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          title: "我的萝卜",
          barButtonItems: [
            NavigationBarButtonItem(
              icon: Icons.settings,
              onPressed: () {
                // TBD
              },
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}