import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:luobo_app/AppDependency.dart';
import 'package:luobo_app/AppRouter.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  final _appDependency = AppDependency();

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      title: "Luobo",
      material: (context, target) => MaterialAppData(),
      cupertino: (context, target) => CupertinoAppData(),
      routes: AppRouter(this._appDependency).routes(),
    );
  }
}
