import 'package:passageiro/core/utils/bloc.dart';
import 'package:passageiro/src/pages/authentication/interface.dart';

import 'state.dart';

class SplashController extends Bloc<AuthenticationState> {
  final IAuthentication authentication;

  SplashController({
    required this.authentication,
  });

  init() async {
    add(AuthenticationState.loading);
    if (await authentication.isUserConnected) {
      add(AuthenticationState.loggedIn);
    } else {
      add(AuthenticationState.loggedOut);
    }
  }
}
