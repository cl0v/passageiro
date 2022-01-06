import 'package:easy_mask/easy_mask.dart';

bool nameValidator(String name) {
  return !(name.length <= 3);
}

bool cpfValidator(String cpf){
  return !(cpf.length < 11+3);
}
