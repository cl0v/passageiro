import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/src/interfaces/http.dart';
import 'package:passageiro/src/blocs/enviroment.dart';
import 'package:passageiro/src/services/token_storage.dart';

import 'interface.dart';
import 'models/utils.dart';
import 'pre-registration/viewmodel.dart';
import 'registration/models.dart';
import 'registration/viewmodel.dart';

class AuthenticationRepository implements IAuthentication {
  final IHttpClient http;
  final TokenStorageService tokenStorageService;

  const AuthenticationRepository({
    required this.http,
    required this.tokenStorageService,
  });

  @override
  Future<bool> get isUserConnected async {
    try {
      final token = await tokenStorageService.token;
      if ((await tokenStorageService.token) != null) {
        final dateTime = await tokenStorageService.expiration;
        final value = !dateTime.compareTo(DateTime.now()).isNegative;
        if (value) http.setAuthorization(token!);
        return value;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> register(UserRegistrationViewModel registration) async {
    try {
      //TODO: Só de fazer o put da certo, mesmo com status code diferente
      final response = await http.put(ApiLevel.v2, httpUserCompleteSignUp,
          jsonEncode(registration.toServerMap()));
      if (response.statusCode != 200) {
        throw CustomError(message: jsonDecode(response.body)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Address?> fetchAddress(String cep) async {
    try {
      final response = await http.rawGet(
        'viacep.com.br',
        'ws/$cep/json/',
      );
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
  Future<bool> sendPhoneCode(int phone) async {
    try {
      final response = await http.post(
        ApiLevel.v2,
        httpUserPhoneSendCode,
        body: jsonEncode(
          {
            "phone": phone,
            "concessionaireId": kConcessionaireToledo,
          },
        ),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)['completedRegistration'];
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }

  //TODO: É a partir daqui que começa a ter o token
  @override
  Future<bool> verifyCode(UserPreRegistrationViewModel model) async {
    try {
      //TODO: Testar o retorno
      final response = await http.post(ApiLevel.v1, httpUserLoginWithPhone,
          body: jsonEncode(
            model.toCodeVerification(),
          ));
      final map = jsonDecode(response.body);
      final r = jsonDecode(response.body);
      tokenStorageService.save(r['token'], r['expire']);
      http.setAuthorization(r['token']);
      return map['success'];
      //TODO: Pedir para remover;

    } catch (e) {
      return false;
    }
  }
}
