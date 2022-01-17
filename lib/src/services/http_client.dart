import 'dart:ffi';

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

  Map<String, String> defaultHeader = const {
    'Content-Type': 'application/json',
  };

  @override
  Future<Response> rawGet(String authority, String path) {
    return client.get(
      _getUri(null, path, authority),
      headers: _header,
    )..then((response) {
        alice.onHttpResponse(response);
        return response;
      });
  }

  @override
  Future<Response> get(
    ApiLevel version,
    String path, {
    Map<String, dynamic>? queryParameters,
    bool authorizationRequired = true,
  }) {
    return client.get(
      _getUri(
        ApiLevel.v1,
        path,
      ),
      headers: _header,
    )..then((response) {
        alice.onHttpResponse(response);
        return response;
      });
  }

  Map<String, String> getHeader(String? body) {
    if (body != null) {
      return _header..addAll({'content-length': body.length.toString()});
    }
    return _header;
  }

  @override
  Future<Response> post(
    ApiLevel version,
    String path, {
    bool headersRequired = true,
    String? body,
    Map<String, dynamic>? queryParameters,
    bool authorizationRequired = true,
  }) {
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
  Future<Response> put(
    ApiLevel version,
    String path,
    String body, {
    bool authorizationRequired = true,
  }) async {
    try {
      return client.put(
        _getUri(version, path),
        body: body,
        headers: getHeader(body),
      )..then((response) {
          alice.onHttpResponse(response);
        });
    } catch (e, s) {
      debugPrint('$e\n$s');
      rethrow;
    }
  }

  Uri _getUri(ApiLevel? version, String unencodedPath, [String? url]) {
    late final String result;

    switch (version) {
      case ApiLevel.v1:
        result = api;
        break;
      case ApiLevel.v2:
        result = apiV2;
        break;
      case null:
        result = url ?? '';
    }

    return Uri.https(result, unencodedPath);
  }

  @override
  setAuthorization(String authorization) {
    _header.addAll({
      'authorization': 'Bearer $authorization',
    });
  }
}
