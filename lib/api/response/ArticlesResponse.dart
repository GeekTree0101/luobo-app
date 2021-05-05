
import 'package:luobo_app/model/Article.dart';

class ArticleResponse {

  final List<Article> articles;

  ArticleResponse({this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {

    List<dynamic> rawArticles = json["data"];

    return ArticleResponse(
      articles: rawArticles.map((e) => Article.fromJson(e)).toList(),
    );
  }

}