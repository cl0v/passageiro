import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/model.dart';
import 'package:passageiro/src/pages/payment/refill/state.dart';
import 'package:passageiro/src/pages/payment/model.dart';
import 'package:passageiro/src/pages/payment/repository.dart';

class PaymentRefillController extends Bloc<PaymentRefillState> {
  int _pageIndex = 0;

  late final PaymentModel model = PaymentModel();

  final IPaymentRepository repository = IPaymentRepository.instance;



  onBackPressed(BuildContext context) {
    if (_pageIndex >= 1) {
      _previousPage();
    } else {
      pop(context);
    }
  }

  nextPage() {
    add(PaymentRefillState.values[++_pageIndex]);
  }

  _previousPage() {
    add(PaymentRefillState.values[--_pageIndex]);
  }
}
