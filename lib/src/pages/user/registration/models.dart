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
    this.state = '',
    this.country = 'BR',
  });
}
