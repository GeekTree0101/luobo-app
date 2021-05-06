import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:luobo_app/views/NavigationBar.dart';

class ChatView extends StatefulWidget {
  ChatView({Key key}) : super(key: key);

  @override
  ChatViewState createState() => ChatViewState();
}

class ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: NavigationBar(
          title: "消息",
          barButtonItems: [],
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Ionicons.chatbubbles_sharp,
                  size: 36.0,
                  color: Colors.blueGrey[100],
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  "没有消息",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
