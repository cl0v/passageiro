import 'dart:convert';

import 'package:passageiro/core/http/api.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/src/services/dio_http.dart';

import 'model.dart';

class VirtualCardRepository {
  DioHttpService http = DioHttpService();

  fetch(VirtualCardFromServer card) async {
    final response =
        await http.patch(api, httpVirtualCard, jsonEncode(card.toJson()));
    print(response.data);
  }
}
