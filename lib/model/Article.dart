import 'package:luobo_app/model/Category.dart';

class Article {
  final int id;
  final String title;
  final String content;
  final int price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int categoryID;
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

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      price: json["price"],
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
      categoryID: json["category_id"],
      imageURL: json["image_url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "price": price,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "category_id": categoryID,
      "image_url": imageURL,
    };
  }
}
