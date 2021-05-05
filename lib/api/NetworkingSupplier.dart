
class NetworkingSupplier {

  bool isDebugMode;

  NetworkingSupplier(bool isDebugMode) {
    this.isDebugMode = isDebugMode;
  }

  String host() {

    return "127.0.0.1:8000";
  }
  
}