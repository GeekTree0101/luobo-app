import 'dart:convert';

import 'package:luobo_app/api/networking.dart';
import 'package:luobo_app/api/request/ArticlesRequest.dart';
import 'package:luobo_app/api/response/ArticlesResponse.dart';

abstract class ArticleRepositoryLogic {

  Future<ArticleResponse> getArticles(ArticlesRequest req);
}

class ArticleRepository implements ArticleRepositoryLogic {

  NetworkingLogic _networking;

  ArticleRepository(NetworkingLogic networking) {
    this._networking = networking;
  }

  @override
  Future<ArticleResponse> getArticles(ArticlesRequest req) {

    return this._networking.fetch(req).then((res) {
      final dynamic jsonBody = jsonDecode(res.body);
      return ArticleResponse.fromJson(jsonBody);
    });
  }
}