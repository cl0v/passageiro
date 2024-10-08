import 'package:dio/dio.dart';
import 'package:passageiro/src/services/alice_http_inspector.dart';
import 'package:passageiro/src/services/token_storage.dart';

class DioHttpService {
  late Dio http = Dio();
  final TokenStorageService tokenService = TokenStorageService();

  DioHttpService() {
    http.interceptors.add(alice.getDioInterceptor());
  }

  Future<Map<String, dynamic>> get headers async {
    final authorization = await tokenService.token;
    if (authorization == null) {
      return {'content-type': 'application/json', "accept": "application/json"};
    }

    return {
      'content-type': 'application/json',
      'Authorization': authorization,
      "accept": "application/json"
    };
  }

  Future<Response> get(
    String url,
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    final options = Options(headers: await headers);
    http.options = BaseOptions(baseUrl: url);
    return http.get(
      path,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response> put(String url, String path, String data) async {
    final options = Options(headers: await headers);
    http.options = BaseOptions(baseUrl: url);
    return http.put(path, data: data, options: options);
  }

  Future<Response> post(String url, String path, dynamic data) async {
    http.options
      ..baseUrl = url
      ..headers = await headers;
    return http.post(path, data: data);

    // final options = Options(headers: await headers, followRedirects: false);
    // http.options = BaseOptions(
    //     baseUrl: url,
    //     receiveDataWhenStatusError: true,
    //     connectTimeout: 60 * 1000, // 60 seconds
    //     receiveTimeout: 60 * 1000 // 60 seconds
    //     );
  }

  Future<Response> patch(
    String url,
    String path,
    dynamic data,
  ) async {
    final options = Options(headers: await headers);
    http.options = BaseOptions(baseUrl: url);
    return http.patch(path, data: data, options: options);
  }
}
