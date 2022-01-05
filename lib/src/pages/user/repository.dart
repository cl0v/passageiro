import 'models/sign_in.dart';

abstract class IUserPreRegistrationRepository {
  verifyCode(SignInModel model);
}

