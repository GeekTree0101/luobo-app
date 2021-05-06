import 'package:flutter/cupertino.dart';
import 'package:luobo_app/scene/category/CategoryModel.dart';
import 'package:luobo_app/scene/home/HomeModel.dart';
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
            providers: [
              ChangeNotifierProvider(
                create: (context) => new HomeModel(_dependency.articleRepository),
              ),
              ChangeNotifierProvider(
                create: (context) => new CategoryModel(_dependency.categoryRepository),
              )
            ],
            builder: (context, child) => new MainView(),
          )
    };
  }
}
