import 'pre-registration/viewmodel.dart';

abstract class IAuthentication {
  Future<bool> get isUserConnected;
  Future<bool> verifyCode(UserPreRegistrationViewModel model);
  sendPhoneCode(int phone);
}
