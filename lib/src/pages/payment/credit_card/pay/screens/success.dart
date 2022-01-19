import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';

class CreditCardPaymentSuccessScreen extends StatefulWidget {
  const CreditCardPaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  _CreditCardPaymentSuccessScreenState createState() =>
      _CreditCardPaymentSuccessScreenState();
}

class _CreditCardPaymentSuccessScreenState
    extends State<CreditCardPaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(label: done),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(
          'Pagamento realizado com sucesso!',
        ),
      ),
    );
  }
}
