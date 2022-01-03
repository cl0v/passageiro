class SignInModel {
  final int phone;
  final String token;
  final String provider;

  SignInModel({
    required this.phone,
    required this.token,
    this.provider = 'phone',
  });
}

class SignUp {
  final int phone;
  final String name;
  final String concessionaireId;

  SignUp({
    required this.name,
    required this.phone,
    this.concessionaireId = '381ab8ad-ecd9-4568-a553-90b926af4ac5',
  });
}
