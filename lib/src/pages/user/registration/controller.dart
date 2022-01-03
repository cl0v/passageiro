import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/src/pages/user/registration/state.dart';
import 'package:passageiro/src/pages/user/registration/viewmodel.dart';

class UserRegistrationController extends Bloc<UserRegistrationState> {
  late final _viewModel = UserRegistrationViewModel();

  int _pageIndex = 0;

  init() {
    add(UserRegistrationState.values[_pageIndex]);
  }

  void setName(String name) {
    _viewModel.name = name;
    _nextPage();
  }

  void setCpf(String cpf) {
    _viewModel.cpf = cpf;
    _nextPage();
  }

  void setCep(String cep) {
    _viewModel.cep = cep;
    _nextPage();
  }

  void setEmail(String email) {
    _viewModel.email = email;
    _nextPage();
  }

  _nextPage() {
    add(UserRegistrationState.values[++_pageIndex]);
  }
}
