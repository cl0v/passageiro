// Apenas o que preciso salvar depois que o fluxo acaba.

import 'package:flutter/foundation.dart';
import 'package:passageiro/src/blocs/enviroment.dart';

class UserPreRegistrationViewModel {
  late String phone = kDebugMode ? '33998525199' : '';
  late String nickname = kDebugMode ? 'Marcelo' : '';
  late String code;

//TODO: Verificar se isso ta certo
  Map<String, dynamic> toCodeVerification() => {
        "phone": int.tryParse(phone),
        "token": code,
        "provider": "phone",
      };

  Map<String, dynamic> toSendCode() => {
        "concessionaireId": kConcessionaireToledo,
        "phone": int.tryParse(phone),
        "name": nickname,
      };
}
