import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NavigationBar extends StatelessWidget {
  final String title;

  NavigationBar({this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          _content(context),
          _bottomLine(context)
        ],
      );
  }

  Widget _content(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
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
        color: Colors.grey[50],
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
        SizedBox(
          width: 4.0,
        ),
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.grey[900],
          size: 8.0,
        ),
      ],
    );
  }

  Widget _rightButtonItemsContainer(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlatformButton(
          color: Colors.grey[900],
          disabledColor: Colors.grey[900],
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.search,
            size: 44.0,
            color: Colors.grey[900],
          ),
        ),
        PlatformButton(
          color: Colors.grey[900],
          disabledColor: Colors.grey[900],
          padding: EdgeInsets.zero,
          child: Icon(
            Icons.notifications_none,
            size: 44.0,
            color: Colors.grey[900],
          ),
        )
      ],
    );
  }
}
