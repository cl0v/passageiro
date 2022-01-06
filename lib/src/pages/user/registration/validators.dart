bool nameValidator(String name) {
  return !(name.length <= 3);
}

bool cepValidator(String cep) {
  return !(cep.length <= 9);
}

bool streetValidator(String street) {
  return !(street.length < 2);
}

bool numValidator(String num) {
  return !(num.length < 0);
}

bool emailValidator(String email) {
  return !(email.length <= 3);
}

bool cpfValidator(String cpf) {
  return !(cpf.length < 11 + 3);
}
