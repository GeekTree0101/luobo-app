import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:luobo_app/api/Networking.dart';
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
      return JsonMapper.fromMap<ArticleResponse>(jsonDecode(res.body));
    });
  }
}