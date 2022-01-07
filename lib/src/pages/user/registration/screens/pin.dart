import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/user/registration/provider.dart';
import 'package:passageiro/src/pages/user/registration/widgets/pin_field.dart';
import '../controller.dart';
import 'package:passageiro/src/widgets/fab.dart';

class UserRegistrationPinScreen extends StatefulWidget {
  const UserRegistrationPinScreen({Key? key}) : super(key: key);

  @override
  _UserRegistrationPinScreenState createState() =>
      _UserRegistrationPinScreenState();
}

class _UserRegistrationPinScreenState extends State<UserRegistrationPinScreen> {
  late final TextEditingController pinController;

  late final UserRegistrationController controller;

  @override
  void initState() {
    pinController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    pinController.text = controller.viewModel.pin;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  bool available = false;

  onChanged(String text) {
    setState(() {
      available = text.length >= 4;
    });
  }

  onNextPressed() {
    controller.setPin(pinController.text);
    controller.onContinuePressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        label: next,
        onPressed: available ? onNextPressed : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Escolha uma senha de 4 dígitos',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            PinFieldWidget(pinController, onChanged),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Esta senha será usada para confimar as transações dentro do aplicativo',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
