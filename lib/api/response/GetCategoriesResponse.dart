
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:luobo_app/model/Category.dart';

@jsonSerializable
class GetCategoreisResponse {

  @JsonProperty(name: "data")
  List<Category> categories;

  GetCategoreisResponse({this.categories});
}