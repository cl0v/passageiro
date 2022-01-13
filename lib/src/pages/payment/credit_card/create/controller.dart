
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';

import '../model.dart';
import 'state.dart';

class CreditCardCreationController extends Bloc<CreditCardCreationState> {
  // final ICreditCard repository;

  late PageController pageController;

  // BuyWithCard paymentInfo;

  int pageIndex = 0;

  String number = kDebugMode ? '5178 6988 3475 9785' : '';
  String name = kDebugMode ? 'Maria Silva' : '';
  String date = kDebugMode ? '02/22' : '';
  String code = kDebugMode ? '255' : '';

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

    // try {
    //   final cardId = await repository.create(creditCard);

    //   if (paymentInfo != null) {
    //     return await _pay(cardId);
    //   }
    //   _next();
    // } catch (e) {
    //   addError(e);
    // }
  }

  // Future _pay(String cardId) async {
  //   try {
  //     await repository.pay(paymentInfo..cardId = cardId);
  //     _next();
  //   } catch (e) {
  //     addError(e);
  //   }
  // }

  @override
  tryAgain(context, onPop) {
    super.tryAgain(context, onPop);
    pageController = PageController(initialPage: pageIndex);
  }

  void _next() => pageController.jumpToPage(++pageIndex);

  void previous() => pageController.jumpToPage(--pageIndex);
}
