import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/user/registration/models.dart';
import 'package:passageiro/src/pages/user/registration/state.dart';
import 'package:passageiro/src/pages/user/registration/viewmodel.dart';

//TODO: Substituir _nextPage nas telas

class UserRegistrationController extends Bloc<UserRegistrationState> {
  late final _viewModel = UserRegistrationViewModel();

  int _pageIndex = 0;

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

  void setImages(List<XFile> images) async {
    final uintSelfie = await images[0].readAsBytes();
    final uintFront = await images[1].readAsBytes();
    final uintBack = await images[2].readAsBytes();
    _viewModel.selfie = base64Encode(uintSelfie);
    _viewModel.front = base64Encode(uintFront);
    _viewModel.back = base64Encode(uintBack);
  }

  void setDocumentType(DocumentType documentType) {
    _viewModel.documentType = documentType;
  }

  void setPin(String pin) {
    _viewModel.pin = pin;
  }

  bool checkPin(String pin) {
    return _viewModel.pin == pin;
  }

  void finish() {
    //TODO: Implementar finalizacao do cadastro
    add(UserRegistrationState.loading);
    if (_register()) {
      add(UserRegistrationState.success);
    } else {
      addError(CustomError(message: 'Algo deu errado'));
    }
  }

  bool _register() {
    return false;
  }

  void onContinuePressed() {
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
