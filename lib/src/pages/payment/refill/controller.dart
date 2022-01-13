import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/payment/refill/state.dart';

class PaymentRefillController extends Bloc<PaymentRefillState> {
  int _pageIndex = 0;





  onBackPressed(BuildContext context) {
    if (_pageIndex >= 1) {
      _previousPage();
    } else {
      pop(context);
    }
  }

  _nextPage() {
    add(PaymentRefillState.values[++_pageIndex]);
  }

  _previousPage() {
    add(PaymentRefillState.values[--_pageIndex]);
  }
}
