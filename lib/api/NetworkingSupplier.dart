
class NetworkingSupplier {

  bool _isDebugMode;

  NetworkingSupplier(bool isDebugMode) {
    this._isDebugMode = isDebugMode;
  }

  String host() {

    return "localhost:8000";
  }
  
}