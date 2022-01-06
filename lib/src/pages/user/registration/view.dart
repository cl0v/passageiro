import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/user/registration/provider.dart';
import 'package:passageiro/src/pages/user/registration/screens/address.dart';
import 'package:passageiro/src/pages/user/registration/state.dart';
import 'package:passageiro/src/screens/error.dart';
import 'package:passageiro/src/screens/loading.dart';
import 'package:passageiro/src/screens/success.dart';

import 'controller.dart';
import 'screens/cep.dart';
import 'screens/cpf.dart';
import 'screens/email.dart';
import 'screens/name.dart';
import 'screens/pictures.dart';
import 'screens/pin.dart';
import 'screens/pin_confirmation.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({Key? key}) : super(key: key);

  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  late UserRegistrationController controller;
  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => controller.onBackPressed(context),
        ),
      ),
      body: StreamBuilder<UserRegistrationState>(
        stream: controller.stream,
        initialData: UserRegistrationState.name,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen(
              text: snapshot.error.toString(),
              onPressed: () => controller.tryAgain(context, () => pop(context)),
            );
          }
          if (!snapshot.hasData) {
            return const LoadingScreen();
          }
          return _StateHandler(state: snapshot.data!);
        },
      ),
    );
  }
}

class _StateHandler extends StatelessWidget {
  const _StateHandler({
    Key? key,
    required this.state,
  }) : super(key: key);
  final UserRegistrationState state;

  @override
  Widget build(BuildContext context) {
    late Widget result = Container();
    switch (state) {
      case UserRegistrationState.name:
        result = const UserNameScreen();
        break;
      case UserRegistrationState.cpf:
        result = const UserCPFScreen();
        break;
      case UserRegistrationState.email:
        result = const UserEmailScreen();
        break;
      case UserRegistrationState.cep:
        result = const UserCepScreen();
        break;
      case UserRegistrationState.address:
        result = const UserAddressScreen();
        break;
      case UserRegistrationState.picture:
        result = const UserRegistrationPicturesScreen();
        break;
      case UserRegistrationState.pin:
        result = const UserRegistrationPinScreen();
        break;
      case UserRegistrationState.pinConfirmation:
        result = const UserRegistrationPinConfirmationScreen();
        break;
      case UserRegistrationState.loading:
        result = const LoadingScreen();
        break;
      case UserRegistrationState.success:
        result = SucessScreen(
          text: 'Parabens! Cadastro completo!',
          onPressed: () {
            pop(context);
          },
        );
        break;
    }
    return result;
  }
}
