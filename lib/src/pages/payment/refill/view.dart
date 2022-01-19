import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/payment/refill/controller.dart';
import 'package:passageiro/src/pages/payment/refill/provider.dart';
import 'package:passageiro/src/pages/payment/refill/state.dart';
import 'package:passageiro/src/screens/error.dart';
import 'package:passageiro/src/screens/loading.dart';

import 'screens/amount.dart';
import 'screens/classes.dart';
import 'screens/method.dart';

class PaymentRefillPage extends StatefulWidget {
  const PaymentRefillPage({Key? key}) : super(key: key);

  @override
  _PaymentRefillPageState createState() => _PaymentRefillPageState();
}

class _PaymentRefillPageState extends State<PaymentRefillPage> {
  late final PaymentRefillController controller;

  @override
  void didChangeDependencies() {
    controller = PaymentRefillProvider.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => controller.onBackPressed(context),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: StreamBuilder<PaymentRefillState>(
          stream: controller.stream,
          initialData: PaymentRefillState.classes,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorScreen(
                text: snapshot.error.toString(),
                onPressed: () => controller.tryAgain(
                  context,
                  () => pop(context),
                ),
              );
            }
            if (!snapshot.hasData) {
              return const LoadingScreen();
            }
            return _StateHandler(state: snapshot.data!);
          },
        ),
      ),
    );
  }
}

class _StateHandler extends StatelessWidget {
  const _StateHandler({
    Key? key,
    required this.state,
  }) : super(key: key);
  final PaymentRefillState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      // case PaymentRefillState.classes:
      //   return PaymentRefillClassScreen();
      case PaymentRefillState.classes:
        return const PaymentRefillClassScreen();
      case PaymentRefillState.amount:
        return const PaymentRefillAmountScreen();
      case PaymentRefillState.method:
        return const PaymentRefillMethodScreen();
    }
  }
}
