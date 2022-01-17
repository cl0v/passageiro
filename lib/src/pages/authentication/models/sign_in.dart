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