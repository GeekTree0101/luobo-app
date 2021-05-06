
import 'package:luobo_app/api/Networking.dart';

class GetCategoriesRequest implements NetworkRequest {

  @override
  EncodingType encodingType = EncodingType.QueryString;

  @override
  NetworkMethod method = NetworkMethod.GET;

  @override
  String path = "/categories";

  @override
  Map<String, dynamic> parameters() {
    return {};
  }

}