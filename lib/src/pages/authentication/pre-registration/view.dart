import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/screens/error.dart';
import 'package:passageiro/src/screens/loading.dart';
import 'screens/nickname.dart';
import 'screens/phone.dart';
import 'controller.dart';
import 'provider.dart';
import 'screens/phone_code_confirmation.dart';
import 'screens/success.dart';
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
  late UserPreRegistrationController controller;

  @override
  void didChangeDependencies() {
    controller = UserPreRegistrationProvider.of(context)!..init(context);
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
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => controller.onBackPressed(context),
        ),
      ),
      body: StreamBuilder<UserPreRegistrationState>(
        stream: controller.stream,
        initialData: UserPreRegistrationState.values.first,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorScreen(
              //TODO: Printar o erro de forma correta com base no error handler!
              text: snapshot.error.toString(),
              onPressed: ()=> controller.tryAgain(context, () {
                pop(context);
              }),
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
