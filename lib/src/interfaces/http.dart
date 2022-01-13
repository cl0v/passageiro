import 'package:http/http.dart';

enum ApiLevel {
  v1,
  v2,
}

abstract class IHttpClient {
  setAuthorization(String authorization);

  Future<Response> get(
    String unencodedPath, {
    String? authority,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post(
    ApiLevel version,
    String path, {
    bool headersRequired = true,
    String body,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> put(
    ApiLevel version,
    String path,
    String body,
  );
}
