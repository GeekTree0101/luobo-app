
import 'package:flutter/material.dart';
import 'package:luobo_app/model/Category.dart';
import 'package:luobo_app/scene/category/components/CategoryItemView.dart';

class CategoryModel extends ChangeNotifier {

  List<CategoryItemViewModel> items = List<CategoryItemViewModel>.empty();

  List<Category> _categories = List<Category>.empty();

  Future<void> fetch() {

    
  }

}