import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/authentication/registration/provider.dart';
import 'package:passageiro/src/pages/home/provider.dart';

import '../interface.dart';
import 'state.dart';
import 'viewmodel.dart';

class UserPreRegistrationController extends Bloc<UserPreRegistrationState> {
  final viewModel = UserPreRegistrationViewModel();

  late final IAuthentication repository;

  UserPreRegistrationController({required this.repository})
      : super(loadingState: UserPreRegistrationState.loading);

  bool alreadyRegistered = false;

  late final BuildContext context;

  init(BuildContext context) {
    this.context = context;
  }

  verifyCode(String code) async {
    //TODO: Implementar verificação de código.
    viewModel.code = code;
    add(UserPreRegistrationState.loading);
    try {
      if (await repository.verifyCode(viewModel)) {
        if (alreadyRegistered) {
          pushNamed(context, HomeProvider.route, replace: true);
        } else {
          pushNamed(context, UserRegistrationProvider.route, replace: true);
        }
      } else {
        addError(
            CustomError(message: 'O código de verificação está incorreto'));
      }
    } catch (e, s) {
      debugPrint('$e\n$s');
      addError(
        CustomError(message: 'Ocorreu um error com o cadastro'),
      );
    }
  }

  void setPhone(String phone) async {
    viewModel.phone = phone;
    try {
      add(UserPreRegistrationState.loading);
      alreadyRegistered = await repository.sendPhoneCode(int.parse(phone));
      onContinuePressed();
    } catch (e) {
      addError(CustomError(message: 'Número de telefone inválido'));
    }
  }

  void setNickname(String nickname) {
    viewModel.nickname = nickname;
    onContinuePressed();
  }

  int _pageIndex = 0;

  onBackPressed(BuildContext context) {
    if (_pageIndex > 0) {
      add(UserPreRegistrationState.values[--_pageIndex]);
    } else {
      pop(context);
    }
  }

  onContinuePressed() {
    add(UserPreRegistrationState.values[++_pageIndex]);
  }
}
