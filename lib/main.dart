import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:luobo_app/AppDependency.dart';
import 'package:luobo_app/AppRouter.dart';
import 'package:luobo_app/main.reflectable.dart';
import 'package:luobo_app/model/Article.dart';
import 'package:luobo_app/model/Category.dart';

void main() {
  initializeReflectable();
  JsonMapper().useAdapter(JsonMapperAdapter(
    valueDecorators: {
      typeOf<List<Article>>(): (value) => value.cast<Article>(),
      typeOf<List<Category>>(): (value) => value.cast<Category>(),
    })
  );
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
