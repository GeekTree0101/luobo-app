import 'package:flutter/cupertino.dart';
import 'package:luobo_app/scene/main/MainView.dart';
import 'package:provider/provider.dart';

import 'AppDependency.dart';

class AppRouter {
  
  AppDependency _dependency;

  AppRouter(AppDependency dependency) {
    this._dependency = dependency;
  }

  Map<String, Widget Function(BuildContext)> routes() {
    return {
      "/": (context) => MultiProvider(
            providers: [],
            builder: (context, child) => new MainView(),
          )
    };
  }
}
