import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'dart:math' as math;

class FABView extends StatefulWidget {
  final String name;

  FABView({Key key, this.name}) : super(key: key);

  @override
  _FABViewState createState() => _FABViewState(name: this.name);
}

class _FABViewState extends State<FABView> {
  final String name;
  bool _isFolded = false;

  _FABViewState({this.name});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: PlatformButton(
        onPressed: () {
          this.setState(() {
            this._isFolded = !this._isFolded;
          });
        },
        padding: EdgeInsets.all(12.0),
        child: _content(),
      ),
      decoration: _decoration(),
    );
  }

  Widget _content() {

    if (_isFolded) {
      return Center(
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Icon(
            Icons.add,
            size: 32.0,
            color: Colors.orange[700],
          ),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add,
          size: 32.0,
          color: Colors.white,
        ),
        SizedBox(width: 4.0),
        Text(
          this.name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: _isFolded ? Colors.white : Colors.orange[700],
      borderRadius: BorderRadius.circular(40.0),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(20),
          spreadRadius: 2.0,
        ),
      ],
    );
  }
}
