import 'package:http/http.dart';

enum ApiLevel {
  v1,
  v2,
}

abstract class IHttpClient {
  setAuthorization(String authorization);

  Future<Response> rawGet(String authority, String path);

  Future<Response> get(
    ApiLevel version,
    String path, {
    Map<String, dynamic>? queryParameters,
    bool authorizationRequired = true,
  });

  Future<Response> post(
    ApiLevel version,
    String path, {
    bool headersRequired = true,
    String body,
    Map<String, dynamic>? queryParameters,
    bool authorizationRequired = true,
  });

  Future<Response> put(
    ApiLevel version,
    String path,
    String body, {
    bool authorizationRequired = true,
  });
}
