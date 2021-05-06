import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luobo_app/views/NavigationBar.dart';
import 'package:luobo_app/views/NavigationBarButtonItem.dart';

class ChatView extends StatefulWidget {

 ChatView({Key key}) : super(key: key);

  @override
   ChatViewState createState() =>  ChatViewState();
}

class ChatViewState extends State<ChatView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          title: "消息",
        ),
        body: Container(),
      ),
    );
  }
}