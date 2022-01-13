class CreditCardModel {
  CreditCardModel({
    required this.number,
    required this.holderName,
    required this.expMonth,
    required this.expYear,
    required this.cvv,
    // this.brand,
  });

  String number;
  String holderName;
  int expMonth;
  int expYear;
  String cvv;
}
