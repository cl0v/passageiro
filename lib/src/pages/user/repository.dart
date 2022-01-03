import 'pre-registration/models.dart';

abstract class IUserPreRegistrationRepository {
  verifyCode(SignInModel model);
  
}

class UserRepository {}
