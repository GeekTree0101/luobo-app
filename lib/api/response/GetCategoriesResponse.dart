
import 'package:luobo_app/model/Category.dart';

class GetCategoreisResponse {

  List<Category> categories;

  GetCategoreisResponse({this.categories});

  factory GetCategoreisResponse.fromJson(Map<String, dynamic> json) {

    List<dynamic> data = json["data"];

    return GetCategoreisResponse(
      categories: data.map((e) => Category.fromJson(e)).toList(),
    );
  }

}