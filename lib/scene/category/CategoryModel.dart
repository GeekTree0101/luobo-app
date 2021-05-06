
import 'package:flutter/material.dart';
import 'package:luobo_app/api/request/GetCategoriesRequest.dart';
import 'package:luobo_app/model/Category.dart';
import 'package:luobo_app/repository/CategoryRepository.dart';
import 'package:luobo_app/scene/category/components/CategoryItemView.dart';

class CategoryModel extends ChangeNotifier {

  CategoryModel(CategoryRepositoryLogic categoryRepository) {
    this._categoryRepository = categoryRepository;
  }

  List<CategoryItemViewModel> items = List<CategoryItemViewModel>.empty();

  List<Category> _categories = List<Category>.empty();
  CategoryRepositoryLogic _categoryRepository;

  Future<void> fetch() async {
    
    final req = GetCategoriesRequest();
    final res = await _categoryRepository.getCategories(req);

    _categories = res.categories;

    items = res.categories.map((e) => CategoryItemViewModel(
      categoryID: e.id,
      imageURL: e.imageURL,
      title: e.name
    )).toList();

    notifyListeners();
  }

}