import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/payment/refill/controller.dart';
import 'package:passageiro/src/pages/payment/refill/provider.dart';
import 'package:passageiro/src/widgets/fab.dart';

class PaymentRefillAmountScreen extends StatefulWidget {
  const PaymentRefillAmountScreen({Key? key}) : super(key: key);

  @override
  State<PaymentRefillAmountScreen> createState() =>
      _PaymentRefillAmountScreenState();
}

class _PaymentRefillAmountScreenState extends State<PaymentRefillAmountScreen> {
  late final PaymentRefillController controller;
  @override
  void didChangeDependencies() {
    controller = PaymentRefillProvider.of(context)!;
    value = controller.model.amount;
    super.didChangeDependencies();
  }

  double value = 0;

  add(double value) {
    setState(() {
      this.value += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        label: next,
        onPressed: () {
          controller.model.amount = value;
          controller.nextPage();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quanto deseja creditar?',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.start,
          ),
          Center(
            child: Text(
              'R\$ ${value.toStringAsFixed(2).replaceAll('.', ',')}',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 12,
              children: [
                InputChip(
                  label: Text('+ R\$ 5,00'),
                  onPressed: () {
                    add(10);
                  },
                ),
                InputChip(
                  label: Text('+ R\$ 10,00'),
                  onPressed: () {
                    add(20);
                  },
                ),
                InputChip(
                  label: Text('+ R\$ 15,00'),
                  onPressed: () {
                    add(30);
                  },
                ),
              ],
            ),
          )
        ]
            .map((e) => Padding(
                  padding: EdgeInsets.only(bottom: 18),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
