// Apenas o que preciso salvar depois que o fluxo acaba.

import 'package:flutter/foundation.dart';

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
}
