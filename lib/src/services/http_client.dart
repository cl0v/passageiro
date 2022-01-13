import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:passageiro/core/http/api.dart';

import 'package:passageiro/src/interfaces/http.dart';

import 'alice_http_inspector.dart';

class HttpClientService implements IHttpClient {
  final client = Client();

  Map<String, String> _header = {
    'Content-Type': 'application/json',
  };

  @override
  Future<Response> get(String unencodedPath,
      {String? authority, Map<String, dynamic>? queryParameters}) {
    return client.get(
      _getUri(
        ApiLevel.v1,
        unencodedPath,
        authority,
      ),
      headers: _header,
    )..then((response) {
        alice.onHttpResponse(response);
        return response;
      });
  }

  Map<String, String> getHeader(String? body) {
    if (body != null)
      {return _header..addAll({'content-length': body.length.toString()});}
    return _header;
  }

  @override
  Future<Response> post(ApiLevel version, String path,
      {bool headersRequired = true,
      String? body,
      Map<String, dynamic>? queryParameters}) {
    try {
      return client.post(
        _getUri(version, path),
        body: body,
        headers: getHeader(body),
      )..then((response) => {alice.onHttpResponse(response)});
    } catch (e, s) {
      debugPrint('$e\n$s');
      rethrow;
    }
  }

  @override
  Future<Response> put(ApiLevel version, String path, String body) async {
    try {
      return client.put(
        _getUri(version, path),
        body: body,
        headers:  getHeader(body),
      )..then((response) {
          alice.onHttpResponse(response);
        });
    } catch (e, s) {
      debugPrint('$e\n$s');
      rethrow;
    }
  }

  Uri _getUri(ApiLevel version, String unencodedPath, [String? url]) {
    late final String result;

    switch (version) {
      case ApiLevel.v1:
        result = api;
        break;
      case ApiLevel.v2:
        result = apiV2;
        break;
    }

    return Uri.https(url ?? result, unencodedPath);
  }

  @override
  setAuthorization(String authorization) {
    _header.addAll({
      'authorization': 'Bearer $authorization',
    });
  }
}
