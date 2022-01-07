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

  Map<String, Object> toServerMap() => {
        'name': name,
        'email': email,
        'document': cpf,
        'concessionaireId': '381ab8ad-ecd9-4568-a553-90b926af4ac5',
        'zipCode': cep,
        'street': address.street,
        'number': address.number,
        'complement': address.complement,
        'neighborhood': address.neighborhood,
        'state': address.state,
        'city': address.city,
        'country': address.country,
        'pin': pin,
        'documentImageType': documentType,
        'documentImageBack': 'data:image/jpeg;base64,$back',
        'documentImageFront': 'data:image/jpeg;base64,$front',
        'faceImage': 'data:image/jpeg;base64,$selfie',
      };
}
