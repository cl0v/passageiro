import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/error_handler.dart';

import '../repository.dart';
import 'model.dart';
import 'state.dart';

class CreditCardCreationController extends Bloc<CreditCardCreationState> {
  final CreditCardRepository repository = CreditCardRepository();

  late PageController pageController;

  // BuyWithCard paymentInfo;

  int pageIndex = 0;

  String number = kDebugMode ? '5178 6988 3475 9785' : '';
  String name = kDebugMode ? 'Maria Silva' : '';
  String date = kDebugMode ? '02/22' : '';
  String code = kDebugMode ? '255' : '';

  late String? cardId;

  // CreditCardCreationController(this.repository);

  void setNumber(String number) {
    this.number = number;
    _next();
  }

  void setName(String name) {
    this.name = name;
    _next();
  }

  void setDate(String date) {
    this.date = date;
    _next();
  }

  void setCode(String code) {
    this.code = code;
    _next();
  }

  Future<void> createCard() async {
    final n = number.replaceAll(" ", "");
    final m = int.parse(date.split("/")[0]);
    final y = int.parse(date.split("/")[1]);

    CreditCardModel creditCard = CreditCardModel(
      number: n,
      holderName: name,
      cvv: code,
      expYear: y,
      expMonth: m,
    );

    try {
      cardId = await repository.create(creditCard);
      _next();
    } catch (e) {
      addError(CustomError(message: 'Não foi possível cadastrar o cartão.'));
    }
  }


  @override
  tryAgain(context, onPop) {
    super.tryAgain(context, onPop);
    pageController = PageController(initialPage: pageIndex);
  }

  void _next() => pageController.jumpToPage(++pageIndex);

  void previous() => pageController.jumpToPage(--pageIndex);
}
