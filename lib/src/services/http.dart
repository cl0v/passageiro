import 'package:passageiro/src/interfaces/http.dart';

class HttpClientService implements IHttpClient {
  @override
  Future get(String unencodedPath,
      {String? authority,
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future post(String unencodedPath,
      {String? authority,
      Map<String, String>? headers,
      bool headersRequired = true,
      body,
      Map<String, dynamic>? queryParameters}) {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  setHeader(Map<String, String> headers) {
    // TODO: implement setHeader
    throw UnimplementedError();
  }
}
