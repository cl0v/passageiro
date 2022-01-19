import 'dart:convert';
import 'package:passageiro/src/pages/authentication/state.dart';

import 'interface.dart';
import 'models/utils.dart';
import 'registration/models.dart';
import 'registration/viewmodel.dart';
import 'package:flutter/material.dart';
import 'pre-registration/viewmodel.dart';
import 'package:passageiro/core/http/api.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/src/blocs/enviroment.dart';
import 'package:passageiro/src/services/dio_http.dart';
import 'package:passageiro/core/utils/error_handler.dart';

class AuthenticationRepository implements IAuthentication {
  final DioHttpService http;

  const AuthenticationRepository({
    required this.http,
  });

  @override
  Future<bool> get isUserConnected async {
    try {
      if ((await http.tokenService.token) != null) {
        final dateTime = await http.tokenService.expiration;
        final value = !dateTime.compareTo(DateTime.now()).isNegative;
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
      final response = await http.put(apiV2, httpUserCompleteSignUp,
          jsonEncode(registration.toServerMap()));
      if (response.statusCode != 200) {
        throw CustomError(message: jsonDecode(response.data)['message']);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Address?> fetchAddress(String cep) async {
    try {
      final response = await http.get(
        'http://viacep.com.br',
        '/ws/$cep/json/',
      );
      if (response.statusCode == 200) {
        AddressFromViaCepApi address =
            AddressFromViaCepApi.fromJson(response.data);
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
  Future<UserAccountCreationState> sendPhoneCode(
      UserPreRegistrationViewModel viewModel) async {
    try {
      final response = await http.post(
        apiV2,
        httpUserPhoneSendCode,
        viewModel.toSendCode(),
      );
      if (response.statusCode == 200) {
        if (jsonDecode(response.data)['completedRegistration'] == true) {
          return UserAccountCreationState.registrationCompleted;
        } else {
          return UserAccountCreationState.preRegistered;
        }
      }
      return UserAccountCreationState.notRegistered;
    } catch (e) {
      rethrow;
    }
  }

  //TODO: É a partir daqui que começa a ter o token
  @override
  Future<bool> verifyCode(UserPreRegistrationViewModel model) async {
    try {
      //TODO: Testar o retorno
      final response = await http.post(
          api, httpUserLoginWithPhone, jsonEncode(model.toCodeVerification()));
      final map = jsonDecode(response.data);
      final r = jsonDecode(response.data);
      http.tokenService.save(r['token'], r['expire']);
      return map['success'];
    } catch (e) {
      return false;
    }
  }
}
