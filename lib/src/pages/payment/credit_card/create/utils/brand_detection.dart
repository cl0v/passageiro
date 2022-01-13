import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:flutter/material.dart';

Widget detectCCBrand(String card) {
  final type = detectCCType(card);
  switch (type) {
    case CreditCardType.visa:
      return Image.asset('assets/images/visa_icoin.png');

    case CreditCardType.mastercard:
      return Image.asset('assets/images/master_icon.png');

    case CreditCardType.discover:
      return Image.asset('assets/images/discover_icon.png');

    case CreditCardType.amex:
      return Image.asset('assets/images/amex_icon.png');

    case CreditCardType.dinersclub:
      return Image.asset('assets/images/dinners_icon.png');

    case CreditCardType.elo:
      return Image.asset('assets/images/elo_icon.png');

    case CreditCardType.hipercard:

    default:
      return Image.asset('assets/images/card_purple_icon.png');
  }
}
