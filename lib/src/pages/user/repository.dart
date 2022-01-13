import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/src/interfaces/http.dart';
import 'package:passageiro/src/pages/user/models/sign_in.dart';
import 'package:passageiro/src/pages/user/models/utils.dart';
import 'package:passageiro/src/pages/user/pre-registration/viewmodel.dart';
import 'package:passageiro/src/pages/user/registration/models.dart';
import 'package:passageiro/src/utils/enviroment.dart';

import 'interface.dart';
import 'registration/viewmodel.dart';

class UserRepository implements IUserPreRegistrationRepository {
  final IHttpClient http;

  UserRepository({
    required this.http,
  });

  Future<void> register(UserRegistrationViewModel registration) async {
    try {
      //TODO: Só de fazer o put da certo, mesmo com status code diferente
      final response = await http.put(ApiLevel.v2, 'api/signUp/complete',
          jsonEncode(registration.toServerMap()));
      if (response.statusCode != 200) {
        throw CustomError(message: 'Não foi possível concluir o cadastro');
      }
    } catch (e) {
      throw CustomError(message: 'Ocorreu um error com a busca');
    }
  }

  Future<Address?> fetchAddress(String cep) async {
    try {
      final response =
          await http.get('ws/$cep/json/', authority: 'viacep.com.br');
      if (response.statusCode == 200) {
        AddressFromViaCepApi address =
            AddressFromViaCepApi.fromJson(response.body);
        return Address(
          street: address.logradouro,
          neighborhood: address.bairro,
          state: address.uf,
          city: address.localidade,
          number: '',
          complement: '',
        );
      }
    } catch (e, s) {
      debugPrint('$e, $s');
      CustomError(message: 'Ocorreu um error ao procurar o endereço');
    }
  }

  @override
  sendCode(int phone) async {
    try {
      await http.post(
        ApiLevel.v2,
        httpUserPhoneSendCode,
        body: jsonEncode(
          {
            "phone": phone,
            "concessionaireId": kConcessionaireToledo,
          },
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  //TODO: É a partir daqui que começa a ter o token
  @override
  Future<bool> verifyCode(UserPreRegistrationViewModel model) async {
    try {
      //TODO: Testar o retorno
      final response = await http.post(ApiLevel.v1, httpUserPhoneCodeVerify,
          body: jsonEncode(
            model.toCodeVerification(),
          ));
      final map = jsonDecode(response.body);
      http.setAuthorization(jsonDecode(response.body)['token']);
      return map['success']; //TODO: Pedir para remover;

    } catch (e) {
      return false;
    }
  }
}
