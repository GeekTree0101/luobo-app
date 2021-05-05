import 'dart:convert';

import 'package:http/http.dart' as http;

import 'NetworkingSupplier.dart';

enum NetworkMethod { GET, PUT, POST, DELETE }

enum EncodingType { QueryString, Body }

class NetworkError {
  int code;
  NetworkErrorData data;

  NetworkError({this.code, this.data});
}

class NetworkErrorData {
  String message;

  NetworkErrorData({this.message});

  factory NetworkErrorData.fromJson(Map<String, dynamic> json) {
    return NetworkErrorData(message: json["message"]);
  }
}

abstract class NetworkRequest {
  String path;
  NetworkMethod method;
  EncodingType encodingType;
  Map<String, dynamic> parameters();
}

abstract class NetworkingLogic {
  Future<http.Response> fetch(NetworkRequest req);
}

class Networking implements NetworkingLogic {
  NetworkingSupplier _supplier;

  Networking(NetworkingSupplier supplier) {
    this._supplier = supplier;
  }

  Map<String, String> headers = {
    "Content-Type": "application/json",
  };

  Future<http.Response> fetch(NetworkRequest req) async {
    Uri url;

    switch (req.encodingType) {
      case EncodingType.QueryString:
        if (this._supplier.isDebugMode) {
          url = Uri.http(_supplier.host(), req.path, req.parameters());
        } else {
          url = Uri.https(_supplier.host(), req.path, req.parameters());
        }
        break;
      case EncodingType.Body:
        if (this._supplier.isDebugMode) {
          url = Uri.http(_supplier.host(), req.path);
        } else {
          url = Uri.https(_supplier.host(), req.path);
        }
        break;
      default:
        throw UnsupportedError("undefined encoding type");
    }

    print(url);

    Future<http.Response> response;

    switch (req.method) {
      case NetworkMethod.GET:
        response = http.get(url, headers: headers);
        break;
      case NetworkMethod.PUT:
        break;
      case NetworkMethod.POST:
        break;
      case NetworkMethod.DELETE:
        break;
    }

    if (response == null) {
      throw UnsupportedError("undefined case");
    }

    return response.then((res) {
      if (res.statusCode == 200) {
        return res;
      }

      final NetworkErrorData data =
          NetworkErrorData.fromJson(jsonDecode(res.body));
      return Future.error(NetworkError(code: res.statusCode, data: data));
    });
  }
}
