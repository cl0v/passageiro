import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/provider.dart';
import 'package:passageiro/src/pages/payment/credit_card/pay/view.dart';
import 'package:passageiro/src/pages/payment/refill/controller.dart';
import 'package:passageiro/src/pages/payment/refill/provider.dart';
import 'package:passageiro/src/pages/payment/model.dart';

import '../card_model.dart';

class PaymentRefillMethodScreen extends StatefulWidget {
  const PaymentRefillMethodScreen({Key? key}) : super(key: key);

  @override
  _PaymentRefillMethodScreenState createState() =>
      _PaymentRefillMethodScreenState();
}

class _PaymentRefillMethodScreenState extends State<PaymentRefillMethodScreen> {
  late final PaymentRefillController controller;
  @override
  void didChangeDependencies() {
    controller = PaymentRefillProvider.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Escolha a forma de pagamento',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 32,
          ),
          FutureBuilder<List<PaymentRefillCardModel>>(
              future: controller.repository.fetchCards(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const LinearProgressIndicator();
                  case ConnectionState.done:
                    return Column(
                      children: snapshot.data
                              ?.map((e) => ListTile(
                                    title: Text('**** ${e.lastFourDigits}'),
                                    onTap: () {
                                      controller.model.cardId = e.cardId;
                                      push(
                                          context,
                                          PaymentCreditCardPage(
                                            payment: controller.model,
                                          ));
                                    },
                                    trailing:
                                        const Icon(Icons.arrow_forward_ios),
                                  ))
                              .toList() ??
                          [],
                    );
                  default:
                }
                return const Center();
              }),
          ListTile(
            title: const Text('Boleto bancário'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Adicionar um cartão de crédito'),
            trailing: const Icon(Icons.add),
            onTap: () async {
              await pushNamed(context, CreditCardCreationProvider.route);
            },
          ),
        ],
      ),
    );
  }
}
