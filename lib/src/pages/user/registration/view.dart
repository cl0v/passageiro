import 'package:flutter/material.dart';
import 'package:passageiro/src/pages/user/registration/provider.dart';
import 'package:passageiro/src/pages/user/registration/state.dart';
import 'package:passageiro/src/screens/error.dart';
import 'package:passageiro/src/screens/loading.dart';

import 'controller.dart';
import 'screens/cep.dart';
import 'screens/cpf.dart';
import 'screens/email.dart';
import 'screens/name.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({Key? key}) : super(key: key);

  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  late UserRegistrationController controller;
  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!..init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<UserRegistrationState>(
        stream: controller.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen(
                text: snapshot.error.toString(),
                onPressed: () {
                  //TODO: OnTap
                });
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
  const _StateHandler({Key? key, required this.state}) : super(key: key);
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
        // TODO: Handle this case.
        break;
      case UserRegistrationState.selfie:
        // TODO: Handle this case.
        break;
      case UserRegistrationState.document:
        // TODO: Handle this case.
        break;
      case UserRegistrationState.password:
        // TODO: Handle this case.
        break;
    }
    return result;
  }
}
