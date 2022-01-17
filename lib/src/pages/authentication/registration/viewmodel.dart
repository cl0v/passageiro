import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_image/flutter_native_image.dart';

import 'models.dart';

enum DocumentType {
  RG,
  CNH,
}

class UserRegistrationViewModel {
  late String name = kDebugMode ? 'MArcelo Viana' : '';
  late String email = kDebugMode ? 'marcelofv12@hotmail.com' : '';
  late String cpf = kDebugMode ? '09847031606' : '';
  late String cep = kDebugMode ? '39890000' : '';
  late Address address = mockedAddress;
  late DocumentType documentType = DocumentType.RG;
  late String selfie = kDebugMode ? 'asas' : '';
  late String front = kDebugMode ? 'asas' : '';
  late String back = kDebugMode ? 'asas' : '';
  late String pin = kDebugMode ? '0000' : '';

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
        'documentImageType': documentTypeConverter(documentType),
        'documentImageBack': 'data:image/jpeg;base64,$back',
        'documentImageFront': 'data:image/jpeg;base64,$front',
        'faceImage': 'data:image/jpeg;base64,$selfie',
      };

  Future<File> compressFile(File file) async {
    late File compressedFile;
    int percentage = 30;
    do {
      if (percentage >= 100) break;
      compressedFile = await FlutterNativeImage.compressImage(
        file.path,
        percentage: percentage,
        quality: percentage,
      );
      percentage += 5;
    } while ((await compressedFile.length()) < 70000);
    return compressedFile;
  }

  String documentTypeConverter(DocumentType type) {
    switch (type) {
      case DocumentType.CNH:
        return 'CNH';
      case DocumentType.RG:
        return 'NEWRG';
    }
  }
}
