class Category {
  final int id;
  final String name;
  final String imageURL;

  Category({this.id, this.name, this.imageURL});

  factory Category.fromJson(Map<String, dynamic> json) {
    return new Category(
      id: json["id"],
      name: json["name"],
      imageURL: json["image_url"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image_url": imageURL,
    };
  }
}
