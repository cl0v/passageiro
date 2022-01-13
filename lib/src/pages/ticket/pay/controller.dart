import 'package:buzzao_ble_protocol/buzzao_ble_protocol.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/error_handler.dart';

import 'state.dart';

//TODO: Depois voltar aqui e ver oq precisa mais
class TicketPaymentController extends Bloc<TicketPaymentState> {
  PageController pageController = PageController();
  int pageIndex = 0;

  late final VirtualCard card;


  void init(VirtualCard card) {
    this.card = card;
    add(TicketPaymentState.idle);
    debugPrint('Iniciado fluxo de leitura de Qr e pagamento da passagem!');
  }

//TODO: Ver o que precisa na captura do qrcode
  onQrCaptured(String? qr) async {
    debugPrint('Qr code lido: $qr');
    if (qr == null) return;
    final qrMap = _parseUri(qr);
    if (qrMap == {}) return;
    String mAddress = qrMap.containsKey('m') ? qrMap['m']! : '';
    String route = qrMap.containsKey('r') ? qrMap['r']! : '';
    String direction = qrMap.containsKey('d') ? qrMap['d']! : '';
    if (mAddress == '' || route == '' || direction == '') {
      return addError(CustomError(message: 'O Qr é inválido.'));
    }

    mAddress =
        '70:b3:d5:7b:${mAddress.substring(0, 2)}:${mAddress.substring(2, 4)}'
            .toUpperCase();

    if (!_checkMacAddressFormat(mAddress)) {
      return addError(CustomError(message: 'O Qr é inválido.'));
    }

    // if (await Vibration.hasVibrator()) {
    //   Vibration.vibrate(duration: 100);
    // }
    next();
    _pay(mAddress);

    return mAddress;
  }

  //TODO: Implementar pagamento
  //TODO: Enviar o cartão por aqui
  _pay(String mac) {
    // data.sendToDevice(mac).listen((event) {
    //   next();
    // }, onError: (error) {
    //   debugPrint('Error: >>>>> $error');
    //   if (error is BlePaymentEvent) {
    //     return addError(TicketPaymentErrorHandler(error.action));
    //   }
    //   addError(TicketPaymentErrorHandler(BlePaymentEvents.errorComunication));
    // });
  }

  Map<String, String> _parseUri(String url) {
    try {
      var uri = Uri.parse(url);
      return uri.queryParameters;
    } catch (e) {
      //TODO: O que fazer quando a url é inválida
      return {};
    }
  }

  @override
  tryAgain(context, onPop) {
    pageController = PageController();
    super.tryAgain(context, onPop);
  }

  bool _checkMacAddressFormat(String id) {
    const pattern = r"^([0-9A-F]{2}[:-]){5}([0-9A-F]{2})$";
    if (!RegExp(pattern).hasMatch(id)) {
      //TODO: O que fazer quando o macaddress é inválido
      return false;
    }
    return true;
  }

  void next() => pageController.jumpToPage(++pageIndex);

  void previous() => pageController.jumpToPage(--pageIndex);
}
