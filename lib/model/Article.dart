import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:luobo_app/model/Category.dart';

@jsonSerializable
class Article {

  @JsonProperty(name: "id")
  final int id;

  @JsonProperty(name: "title")
  final String title;

  @JsonProperty(name: "content")
  final String content;

  @JsonProperty(name: "price")
  final int price;

  @JsonProperty(name: "created_at", converterParams: { "format" : "yyyy-MM-dd'T'hh:mm:ssz" })
  final DateTime createdAt;

  @JsonProperty(name: "updated_at", converterParams: { "format" : "yyyy-MM-dd'T'hh:mm:ssz" })
  final DateTime updatedAt;
  
  @JsonProperty(name: "category_id")
  final int categoryID;

  @JsonProperty(name: "image_url")
  final String imageURL;

  Article({
    this.id,
    this.title,
    this.content,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.categoryID,
    this.imageURL,
  });
}
