import 'dart:convert';

class AddressFromViaCepApi {
  AddressFromViaCepApi({
    required this.logradouro,
    required this.cep,
    required this.complemento,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.unidade,
    required this.ibge,
    required this.gia,
  });

  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String unidade;
  final String ibge;
  final String gia;

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'unidade': unidade,
      'ibge': ibge,
      'gia': gia,
    };
  }

  factory AddressFromViaCepApi.fromMap(Map<String, dynamic> map) {
    return AddressFromViaCepApi(
      cep: map['cep'] ?? '',
      logradouro: map['logradouro'] ?? '',
      complemento: map['complemento'] ?? '',
      bairro: map['bairro'] ?? '',
      localidade: map['localidade'] ?? '',
      uf: map['uf'] ?? '',
      unidade: map['unidade'] ?? '',
      ibge: map['ibge'] ?? '',
      gia: map['gia'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressFromViaCepApi.fromJson(String source) => AddressFromViaCepApi.fromMap(json.decode(source));
}
