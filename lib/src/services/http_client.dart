import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:passageiro/core/http/api.dart';

import 'package:passageiro/src/interfaces/http.dart';

import 'alice_http_inspector.dart';

class HttpClientService implements IHttpClient {
  final client = Client();

  HttpClientService() {
    print('Adicionado');
  }

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
  Future<Response> put(ApiLevel version, String path, String body) async {
    try {
      return client.put(_getUri(version, path), body: body)
        ..then((response) {
          alice.onHttpResponse(response);
        });
    } catch (e, s) {
      debugPrint('$e\n$s');
      rethrow;
    }
  }

  Uri _getUri(ApiLevel version, String unencodedPath) {
    late final String result;

    switch (version) {
      case ApiLevel.V1:
        result = api;
        break;
      case ApiLevel.V2:
        result = apiV2;
        break;
    }

    return Uri.https(result, unencodedPath);
  }

  @override
  setHeader(Map<String, String> headers) {
    // TODO: implement setHeader
    throw UnimplementedError();
  }
}
