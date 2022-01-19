import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/src/pages/payment/model.dart';
import 'package:passageiro/src/pages/payment/repository.dart';

import 'state.dart';

class CreditCardPaymentController extends Bloc<CreditCardPaymentState> {
  final IPaymentRepository repository = IPaymentRepository.instance;

  init(PaymentModel payment) async {
    try {
      await repository.pay(payment);
      add(CreditCardPaymentState.success);
    } catch (e) {
      add(CreditCardPaymentState.failed);
    }
  }
}
