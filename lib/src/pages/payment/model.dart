import 'package:uuid/uuid.dart';

enum PaymentMethod {
  creditCard,
  boleto,
}

class PaymentModel {
  late String classId = '';
  late double amount = 10;
  late PaymentMethod method = PaymentMethod.boleto;
  late String cardId;
  late String transactionId = Uuid().v5(Uuid.NAMESPACE_OID, 'buzzao-$hashCode');

  Map<String, dynamic> toMap() => {
        "amount": amount,
        "walletClassId": classId,
        "paymentcreditcard": {
          "cardid": cardId,
        },
        "transactionId": transactionId
      };
}
