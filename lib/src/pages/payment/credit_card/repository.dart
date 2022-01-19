import 'dart:convert';

import 'package:passageiro/core/http/api.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/src/services/dio_http.dart';

import 'create/model.dart';

class CreditCardRepository {
  DioHttpService http = DioHttpService();
  Future<String> create(CreditCardModel model) async {
    final response = await http.post(
      apiV2,
      httpCreditCardCreate,
      jsonEncode(model),
    );
    return response.data['id'];
  }
}
