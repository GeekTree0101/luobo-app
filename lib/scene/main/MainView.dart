import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:ionicons/ionicons.dart';
import 'package:luobo_app/scene/category/CategoryView.dart';
import 'package:luobo_app/scene/chat/ChatView.dart';
import 'package:luobo_app/scene/home/HomeView.dart';
import 'package:luobo_app/scene/myluobo/MyLuoboView.dart';

class MainView extends StatefulWidget {
  @override
  MainView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainState();
}

class MainState extends State<MainView> {
  final Color activeColor = Colors.grey[900];
  final Color inactiveColor = Colors.grey[900];
  final double iconSize = 24.0;

  @override
  Widget build(BuildContext context) {
    return PlatformTabScaffold(
      bodyBuilder: (context, index) {
        switch (index) {
          case 0:
            return HomeView();
          case 1:
            return CategoryView();
          case 2:
            return ChatView();
          case 3:
            return MyLuoboView();
          default:
            break;
        }

        return Container();
      },
      tabController: PlatformTabController(
        initialIndex: 0,
      ),
      materialTabs: (context, platform) => MaterialNavBarData(
        backgroundColor: Colors.white,
        items: _bottomItems(context),
        selectedItemColor: activeColor,
        unselectedItemColor: inactiveColor,
      ),
      cupertinoTabs: (context, platform) => CupertinoTabBarData(
          backgroundColor: Colors.white,
          items: _bottomItems(context),
          activeColor: activeColor,
          inactiveColor: inactiveColor),
    );
  }

  List<BottomNavigationBarItem> _bottomItems(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: Icon(
          Ionicons.home_outline,
          color: inactiveColor,
          size: iconSize,
        ),
        activeIcon: Icon(
          Ionicons.home,
          color: activeColor,
          size: iconSize,
        ),
        label: "首页",
      ),
      BottomNavigationBarItem(
          icon: Icon(
            Ionicons.menu_outline,
            color: inactiveColor,
            size: iconSize,
          ),
          activeIcon: Icon(
            Ionicons.menu,
            color: activeColor,
            size: iconSize,
          ),
          label: "分类"),
      BottomNavigationBarItem(
          icon: Icon(
            Ionicons.chatbubbles_outline,
            color: inactiveColor,
            size: iconSize,
          ),
          activeIcon: Icon(
            Ionicons.chatbubbles,
            color: activeColor,
            size: iconSize,
          ),
          label: "消息"),
      BottomNavigationBarItem(
          icon: Icon(
            Ionicons.person_outline,
            color: inactiveColor,
            size: iconSize,
          ),
          activeIcon: Icon(
            Ionicons.person,
            color: activeColor,
            size: iconSize,
          ),
          label: "我的萝卜")
    ];
  }
}
