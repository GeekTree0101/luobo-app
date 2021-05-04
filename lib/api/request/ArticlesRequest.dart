
import 'package:luobo_app/api/networking.dart';

class ArticlesRequest implements NetworkRequest {

  final int nextID;

  ArticlesRequest({this.nextID});

  @override
  EncodingType encodingType = EncodingType.QueryString;

  @override
  NetworkMethod method = NetworkMethod.GET;

  @override
  String path = "/articles";

  @override
  Map<String, dynamic> parameters() {

    if (nextID != null) {
      return {
        "next_id": nextID,
      };
    } else {
      return {};
    }
  }

}