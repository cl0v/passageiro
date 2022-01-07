import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/user/registration/models.dart';
import 'package:passageiro/src/pages/user/registration/state.dart';
import 'package:passageiro/src/pages/user/registration/viewmodel.dart';
import 'package:passageiro/src/pages/user/repository.dart';
import 'package:passageiro/src/services/http_client.dart';

//TODO: Substituir _nextPage nas telas

class UserRegistrationController extends Bloc<UserRegistrationState> {
  UserRegistrationController({required this.repository});

  late final viewModel = UserRegistrationViewModel();

  final UserRepository repository;

  int _pageIndex = 0;

  void setName(String name) {
    viewModel.name = name;
    _nextPage();
  }

  void setCpf(String cpf) {
    viewModel.cpf = cpf;
    _nextPage();
  }

  void setCep(String cep) {
    viewModel.cep = cep;
    _nextPage();
  }

  void setEmail(String email) {
    viewModel.email = email;
    _nextPage();
  }

  void setAddress(String street, String number, String complement) {
    viewModel.address = Address(
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
    viewModel.selfie = base64Encode(uintSelfie);
    viewModel.front = base64Encode(uintFront);
    viewModel.back = base64Encode(uintBack);
  }

  void setDocumentType(DocumentType documentType) {
    viewModel.documentType = documentType;
  }

  void setPin(String pin) {
    viewModel.pin = pin;
  }

  bool checkPin(String pin) {
    return viewModel.pin == pin;
  }

  void finish() async {
    add(UserRegistrationState.loading);
    try {
      await repository.register(viewModel);
      add(UserRegistrationState.success);
    } catch (e) {
      addError(e as CustomError);
    }
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
