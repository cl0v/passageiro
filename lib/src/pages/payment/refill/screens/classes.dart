import 'package:flutter/material.dart';
import 'package:passageiro/src/models/wallet_classes.dart';
import 'package:passageiro/src/pages/payment/refill/controller.dart';
import 'package:passageiro/src/pages/payment/refill/provider.dart';

import '../../model.dart';

class PaymentRefillClassScreen extends StatefulWidget {
  const PaymentRefillClassScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentRefillClassScreen> createState() =>
      _PaymentRefillClassScreenState();
}

class _PaymentRefillClassScreenState extends State<PaymentRefillClassScreen> {
  late final PaymentRefillController controller;
  @override
  void didChangeDependencies() {
    controller = PaymentRefillProvider.of(context)!;
    super.didChangeDependencies();
  }

  Widget tile(WalletClasses classe) {
    return Card(
      child: ListTile(
        title: Text(classe.name),
        onTap: () {
          controller.model.classId = classe.classId.toString();
          controller.nextPage();
        },
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Qual cartão deseja recarregar?',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.start,
          ),
          tile(WalletClasses(name: 'className', classId: 2, id: 'ddsa')),
          FutureBuilder<List<WalletClasses>>(
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  return Column(
                    children: snapshot.data?.map(tile).toList() ?? [],
                  );
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
