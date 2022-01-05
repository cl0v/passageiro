import 'package:flutter/material.dart';
import 'package:passageiro/src/pages/user/pre-registration/screens/success.dart';
import 'package:passageiro/src/screens/loading.dart';
import 'screens/nickname.dart';
import 'screens/phone.dart';
import 'controller.dart';
import 'provider.dart';
import 'screens/phone_code_confirmation.dart';
import 'state.dart';

class UserPreRegistrationPage extends StatefulWidget {
  const UserPreRegistrationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<UserPreRegistrationPage> createState() =>
      _UserPreRegistrationPageState();
}

class _UserPreRegistrationPageState extends State<UserPreRegistrationPage> {
  late final UserPreRegistrationController controller;

  @override
  void didChangeDependencies() {
    controller = UserPreRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<UserPreRegistrationState>(
        stream: controller.stream,
        initialData: UserPreRegistrationState.values.first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              //TODO: Printar o erro de forma correta com base no error handler!
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text('Algo deu errado!');
          }
          return _StateHandler(
            state: snapshot.data!,
          );
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

  final UserPreRegistrationState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case UserPreRegistrationState.nick:
        return const NicknameScreen();
      case UserPreRegistrationState.phone:
        return const UserPhoneScreen();
      case UserPreRegistrationState.code:
        return const UserPhoneCodeConfirmationScreen();
      case UserPreRegistrationState.loading:
        return const LoadingScreen();
      case UserPreRegistrationState.success:
        return const UserPreRegistrationSuccessScreen();
    }
  }
}
