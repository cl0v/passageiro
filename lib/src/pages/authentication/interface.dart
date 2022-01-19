import 'pre-registration/viewmodel.dart';
import 'state.dart';

abstract class IAuthentication {
  Future<bool> get isUserConnected;
  Future<bool> verifyCode(UserPreRegistrationViewModel model);
  Future<UserAccountCreationState> sendPhoneCode(UserPreRegistrationViewModel model);
}
