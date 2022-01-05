import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/user/registration/models.dart';
import 'package:passageiro/src/pages/user/registration/state.dart';
import 'package:passageiro/src/pages/user/registration/viewmodel.dart';

class UserRegistrationController extends Bloc<UserRegistrationState> {
  late final _viewModel = UserRegistrationViewModel();

  int _pageIndex = 0;

  init() {
    add(UserRegistrationState.values[_pageIndex]);
  }

  void setName(String name) {
    _viewModel.name = name;
    _nextPage();
  }

  void setCpf(String cpf) {
    _viewModel.cpf = cpf;
    _nextPage();
  }

  void setCep(String cep) {
    _viewModel.cep = cep;
    _nextPage();
  }

  void setEmail(String email) {
    _viewModel.email = email;
    _nextPage();
  }

  void setAddress(String street, String number, String complement) {
    _viewModel.address = Address(
      street: street,
      number: number,
      complement: complement,
    );
    _nextPage();
  }

  void onBackPressed(BuildContext context) {
    if (_pageIndex >= 1) {
      _previousPage();
    } else {
      pop(context);
    }
  }

  _nextPage() {
    add(UserRegistrationState.values[++_pageIndex]);
  }

  _previousPage() {
    add(UserRegistrationState.values[--_pageIndex]);
  }
}
