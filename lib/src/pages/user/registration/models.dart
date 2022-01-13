import 'package:flutter/foundation.dart';

class Address {
  final String street;
  final String number;
  final String complement;
  final String neighborhood;
  final String city;
  final String state;
  final String country;

  Address({
    required this.street,
    required this.number,
    required this.complement,
    //TODO: Implementar sistema de encontrar o bairro através do cpf
    this.neighborhood = 'Centro',
    this.city = 'Toledo',
    this.state = 'PR', //TODO: Remover o estado de forma hardcoded
    this.country = 'BR',
  });
}

Address mockedAddress = kDebugMode? Address(
  street: 'street',
  number: '111',
  complement: 'complement',
) : Address(street: 'street', number: '111', complement: 'complement');
