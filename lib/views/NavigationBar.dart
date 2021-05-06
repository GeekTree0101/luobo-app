import 'package:flutter/material.dart';
import 'package:luobo_app/views/NavigationBarButtonItem.dart';

class NavigationBar extends StatelessWidget with PreferredSizeWidget {
  NavigationBar({this.title, this.barButtonItems});

  final String title;
  List<NavigationBarButtonItem> barButtonItems;

  @override
  Size get preferredSize => Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _content(context),
        _bottomLine(context),
      ],
    );
  }

  Widget _content(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.0, left: 16.0, bottom: 10.0, right: 16.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _title(context),
          _rightButtonItemsContainer(context),
        ],
      ),
    );
  }

  Widget _bottomLine(BuildContext context) {
    return SizedBox(
      height: 0.5,
      child: Container(
        color: Colors.grey[400],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.grey[900],
      ),
    );
  }

  Widget _rightButtonItemsContainer(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.end,
      spacing: 12.0,
      runSpacing: 12.0,
      children: this.barButtonItems ?? [],
    );
  }
}
