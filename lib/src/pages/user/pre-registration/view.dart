import 'package:flutter/material.dart';
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
    // controller.add(UserPreRegistrationState.phone);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // floatingActionButton: CustomFabExtended(label: 'Continuar', onPressed: (){},),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
          }),
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
        return  NicknameScreen();
      case UserPreRegistrationState.phone:
        return UserPhoneScreen();
      case UserPreRegistrationState.code:
        return UserPhoneCodeConfirmationScreen();
      default:
        return Container();
    }
  }
}
