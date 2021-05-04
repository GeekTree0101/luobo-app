
import 'package:luobo_app/model/Article.dart';

class ArticleResponse {

  final List<Article> articles;

  ArticleResponse({this.articles});

  factory ArticleResponse.fromJson(Map<String, dynamic> json) {
    return ArticleResponse(
      articles: json["data"],
    );
  }

}