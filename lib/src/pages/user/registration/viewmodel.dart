import 'models.dart';

enum DocumentType {
  RG,
  CNH,
}

class UserRegistrationViewModel {
  late String name;
  late String email;
  late String cpf;
  late String cep;
  late Address address;
  late String selfie;
  late String front;
  late String back;
  late DocumentType documentType;
  late String pin = '4444';
}
