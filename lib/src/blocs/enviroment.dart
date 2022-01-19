import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:passageiro/core/http/api.dart';
import 'package:passageiro/core/http/endpoint.dart';
import 'package:passageiro/core/utils/error_handler.dart';
import 'package:passageiro/src/interfaces/http.dart';
import 'package:passageiro/src/models/wallet_classes.dart';
import 'package:passageiro/src/services/dio_http.dart';
import 'package:passageiro/src/services/http_client.dart';

const String kConcessionaireToledo = '381ab8ad-ecd9-4568-a553-90b926af4ac5';
const String kConcessionaireMaterialize =
    '4e43da97-9e95-46f6-8694-7dbd0c949bd8';
const bool kUseMock = false;

class EnviromentRepository {
  final DioHttpService http;
  EnviromentRepository(this.http);

  Future<List<WalletClasses>> fetchUserClasses() async {
    final response = await http.get(api, httpEnviromentUserClasses);
    if (response.statusCode != 200) {
      throw CustomError(message: 'Não foi possível baixar as classes');
    }
    final List<Map<String, dynamic>> list = jsonDecode(response.data);
    return list.map((e) => WalletClasses.fromMap(e)).toList();
  }
}

class Enviroment extends InheritedWidget {
  const Enviroment({Key? key, required Widget child, required this.bloc})
      : super(key: key, child: child);

  final EnviromentBloc bloc;

  static EnviromentBloc? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Enviroment>()?.bloc;
  }

  @override
  bool updateShouldNotify(Enviroment oldWidget) {
    return true;
  }
}

class EnviromentBloc {
  //TODO: Esse cara terá as coisas necessarias para variaveis de ambiente globais

  late EnviromentRepository repository =
      EnviromentRepository(DioHttpService());
  List<WalletClasses> _userClasses = [];

  Future<List<WalletClasses>> fetchUserClasses() async {
    if (_userClasses.isEmpty) {
      _userClasses = await repository.fetchUserClasses();
    }
    return _userClasses;
  }
}
