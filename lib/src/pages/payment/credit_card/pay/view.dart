import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/payment/credit_card/pay/controller.dart';
import 'package:passageiro/src/pages/payment/credit_card/pay/screens/review.dart';
import 'package:passageiro/src/pages/payment/credit_card/pay/state.dart';
import 'package:passageiro/src/pages/payment/model.dart';
import 'package:passageiro/src/screens/error.dart';
import 'package:passageiro/src/screens/loading.dart';

import 'screens/failed.dart';
import 'screens/success.dart';

class PaymentCreditCardPage extends StatefulWidget {
  const PaymentCreditCardPage({
    Key? key,
    required this.payment,
  }) : super(key: key);
  final PaymentModel payment;

  @override
  _PaymentCreditCardPageState createState() => _PaymentCreditCardPageState();
}

class _PaymentCreditCardPageState extends State<PaymentCreditCardPage> {
  late final CreditCardPaymentController controller;

  @override
  void initState() {
    controller = CreditCardPaymentController()..init(widget.payment);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<CreditCardPaymentState>(
        stream: controller.stream,
        initialData: CreditCardPaymentState.loading,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen(
                text: 'Ocorreu um error com o pagamento.',
                onPressed: controller.tryAgain(context, () {
                  pop(context);
                }));
          }
          return _StateHandler(state: snapshot.data!);
        },
      ),
    );
  }
}

class _StateHandler extends StatelessWidget {
  const _StateHandler({Key? key, required this.state}) : super(key: key);
  final CreditCardPaymentState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case CreditCardPaymentState.review:
        return const CreditCardPaymentReviewScreen();
      case CreditCardPaymentState.loading:
        return const LoadingScreen();
      case CreditCardPaymentState.success:
        return const CreditCardPaymentSuccessScreen();
      case CreditCardPaymentState.failed:
        return const CreditCardPaymentFailedScreen();
    }
  }
}
