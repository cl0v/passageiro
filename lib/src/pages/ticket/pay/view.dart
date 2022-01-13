import 'package:buzzao_ble_protocol/buzzao_ble_protocol.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/design_system/colors.dart';
import 'package:passageiro/src/screens/error.dart';

import 'controller.dart';
import 'provider.dart';
import 'screens/loading.dart';
import 'screens/scanner.dart';
import 'screens/success.dart';
import 'state.dart';

class TicketPaymentPage extends StatefulWidget {
  const TicketPaymentPage({Key? key}) : super(key: key);

  static const argCard = 'card'; //TODO: Adicionar um virtual card

  @override
  _TicketPaymentPageState createState() => _TicketPaymentPageState();
}

class _TicketPaymentPageState extends State<TicketPaymentPage> {
  late final TicketPaymentController controller;
  @override
  void didChangeDependencies() {
    final VirtualCard card = (ModalRoute.of(context)?.settings.arguments
        as Map)[TicketPaymentPage.argCard];
    controller = TicketPaymentProvider.of(context)!..init(card);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.pageController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      QrScannerScreen(
        onRead: controller.onQrCaptured,
        text: 'Aponte a câmera para\no código QR no ônibus',
      ),
      const TicketPaymentLoadingScreen(),
      TicketPaymentSucess(
        onPressed: () => pop(context),
      ),

      // TODO: Remover essa tratativa de erros
    ];
    return StreamBuilder<TicketPaymentState>(
      stream: controller.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen(
            text: snapshot.error.toString(),
            onPressed: () => pop(context),
          );
        }
        return PageView(
          controller: controller.pageController,
          children: pages,
        );
      },
    );
  }
}
