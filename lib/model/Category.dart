import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Category {

  @JsonProperty(name: "id")
  final int id;

  @JsonProperty(name: "name")
  final String name;

  @JsonProperty(name: "image_url")
  final String imageURL;

  Category({this.id, this.name, this.imageURL});
}
