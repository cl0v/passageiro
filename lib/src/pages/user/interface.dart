import 'pre-registration/viewmodel.dart';

abstract class IUserPreRegistrationRepository {
  Future<bool> verifyCode(UserPreRegistrationViewModel model);
  sendCode(int phone);
}
