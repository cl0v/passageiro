import 'package:flutter/foundation.dart';
import 'package:passageiro/core/http/api.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/src/blocs/enviroment.dart';
import 'package:passageiro/src/interfaces/http.dart';
import 'package:passageiro/src/pages/payment/model.dart';
import 'package:passageiro/src/services/dio_http.dart';
import 'package:passageiro/src/services/http_client.dart';

import 'refill/card_model.dart';

abstract class IPaymentRepository {
  Future<List<PaymentRefillCardModel>> fetchCards();

  static get instance =>
      kDebugMode && kUseMock ? MockedPaymentRepository() : PaymentRepository();

  pay(PaymentModel payment);

  
}

class PaymentRepository implements IPaymentRepository {
  DioHttpService http = DioHttpService();

  @override
  fetchCards() async {
    final response = await http.get(api, httpUserRegisteredCards);
    return response.data;
  }

  @override
  pay(PaymentModel payment) {}
}

class MockedPaymentRepository implements IPaymentRepository {
  Future<List<PaymentRefillCardModel>> fetchCards() async {
    return [];
  }

  @override
  pay(PaymentModel payment) {
    // TODO: implement pay
    throw UnimplementedError();
  }
}
