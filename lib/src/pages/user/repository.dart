import 'dart:convert';

import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/src/interfaces/http.dart';

import 'models/sign_in.dart';
import 'registration/viewmodel.dart';

abstract class IUserPreRegistrationRepository {
  verifyCode(SignInModel model);
}

class UserRepository {
  final IHttpClient http;

  UserRepository({
    required this.http,
  });

  register(UserRegistrationViewModel registration) async {
    try {
      //TODO: Só de fazer o put da certo, mesmo com status code diferente
      await http.put(ApiLevel.V2, 'api/signUp/complete',
          jsonEncode(registration.toServerMap()));
    } catch (e) {
      throw CustomError(message: 'Ocorreu um error com a busca');
    }
  }
}
