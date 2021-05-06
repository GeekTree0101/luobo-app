import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NavigationBarButtonItem extends StatelessWidget {
  
  NavigationBarButtonItem({this.icon, this.onPressed});

  IconData icon;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.0,
      height: 24.0,
      child: PlatformButton(
        color: Colors.transparent,
        disabledColor: Colors.transparent,
        padding: EdgeInsets.zero,
        onPressed: () => this.onPressed,
        child: Icon(
          this.icon,
          size: 28.0,
          color: Colors.grey[900],
        ),
      ),
    );
  }
}
