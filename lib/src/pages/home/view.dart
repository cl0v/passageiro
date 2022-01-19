import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/blocs/enviroment.dart';
import 'package:passageiro/src/pages/home/controller.dart';
import 'package:passageiro/src/pages/payment/refill/provider.dart';
import 'package:passageiro/src/widgets/virtual_card/view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeController();
  @override
  void didChangeDependencies() {
    Enviroment.of(context)?.fetchUserClasses(); //TODO: Encontrar as classes ao acessar a home
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // VirtualCardWidget(viewModel: controller.virtualCardViewModel),
          ElevatedButton(
              onPressed: () async {
                await pushNamed(context, PaymentRefillProvider.route);
              },
              child: Text('Precisa de créditos?')),
        ],
      ),
    );
  }
}
