import 'package:http/http.dart' as http;

class HttpClient {
  http.Client client;
  http.Client getClient() => client;

  static HttpClient _httpClient;

  static HttpClient getInstance() {
    if (_httpClient == null) {
      _httpClient = new HttpClient();
      _httpClient.client = new http.Client();
    }

    return _httpClient;
  }
}