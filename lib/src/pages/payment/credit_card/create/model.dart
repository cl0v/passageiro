class CreditCardModel {
  CreditCardModel({
    required this.number,
    required this.holderName,
    required this.expMonth,
    required this.expYear,
    required this.cvv,
  });

  String number;
  String holderName;
  int expMonth;
  int expYear;
  String cvv;

  Map<String, dynamic> toJson() => {
        'number': number,
        'holderName': holderName,
        'expMonth': expMonth,
        'expYear': expYear,
        'cvv': cvv,
      };
}
