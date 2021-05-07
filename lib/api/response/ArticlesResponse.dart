
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:luobo_app/model/Article.dart';

@jsonSerializable
class ArticleResponse {

  @JsonProperty(name: "data")
  final List<Article> articles;

  ArticleResponse({this.articles});
}