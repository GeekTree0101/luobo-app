
import 'dart:convert';

import 'package:luobo_app/api/Networking.dart';
import 'package:luobo_app/api/request/GetCategoriesRequest.dart';
import 'package:luobo_app/api/response/GetCategoriesResponse.dart';
import 'package:luobo_app/model/Category.dart';

abstract class CategoryRepositoryLogic {

  Future<GetCategoreisResponse> getCategories(GetCategoriesRequest req);
}

class CategoryRepository implements CategoryRepositoryLogic {

  NetworkingLogic _networking;

  CategoryRepository(NetworkingLogic networking) {
    this._networking = networking;
  }

  @override
  Future<GetCategoreisResponse> getCategories(GetCategoriesRequest req) {

    return this._networking.fetch(req).then((res) {
      final dynamic jsonBody = jsonDecode(res.body);
      return GetCategoreisResponse.fromJson(jsonBody);
    });
  }

}