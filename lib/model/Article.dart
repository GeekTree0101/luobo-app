import 'package:luobo_app/model/Category.dart';

class Article {
  final int id;
  final String title;
  final String content;
  final double price;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int categoryID;
  final Category category;

  Article({
    this.id,
    this.title,
    this.content,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.categoryID,
    this.category,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json["id"],
      title: json["title"],
      content: json["content"],
      price: json["price"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      categoryID: json["category_id"],
      category: Category.fromJson(
        json["category"],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "price": price,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "category_id": categoryID,
    };
  }
}
