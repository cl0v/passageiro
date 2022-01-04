import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/home/provider.dart';
import 'package:passageiro/src/pages/user/pre-registration/viewmodel.dart';

import 'state.dart';

class UserPreRegistrationController extends Bloc<UserPreRegistrationState> {
  final _viewModel = UserPreRegistrationViewModel();

  // PageController controller = PageController();

  // next() => controller.nextPage(
  //     duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
  // back() => controller.previousPage(
  //     duration: const Duration(milliseconds: 200), curve: Curves.easeIn);

  Function verifyCode(BuildContext context, String code) {
    //TODO: Implementar verificação de código.
    _viewModel.code = code;
    return () {};
  }

  _onCodeVerificationSucess(BuildContext context) {
    pushNamed(context, HomeProvider.route);
  }

  _onCodeVerificationFailed() {}

  void setPhone(String phone) {
    _viewModel.phone = phone;
    add(UserPreRegistrationState.code);
  }

  void setNickname(String nickname) {
    _viewModel.nickname = nickname;
    add(UserPreRegistrationState.phone);
  }
}
