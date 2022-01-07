enum ApiLevel {
  V1,
  V2,
}

abstract class IHttpClient {
  setHeader(Map<String, String> headers);

  Future<dynamic> get(
    String unencodedPath, {
    String? authority,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> post(
    String unencodedPath, {
    String? authority,
    Map<String, String>? headers,
    bool headersRequired = true,
    dynamic body,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> put(
    ApiLevel version,
    String path,
    String body,
  );
}
