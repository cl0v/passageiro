import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/user/registration/widgets/pin_field.dart';
import 'package:passageiro/src/widgets/fab.dart';

import '../controller.dart';
import '../provider.dart';

class UserRegistrationPinConfirmationScreen extends StatefulWidget {
  const UserRegistrationPinConfirmationScreen({Key? key}) : super(key: key);

  @override
  _UserRegistrationPinConfirmationScreenState createState() =>
      _UserRegistrationPinConfirmationScreenState();
}

class _UserRegistrationPinConfirmationScreenState
    extends State<UserRegistrationPinConfirmationScreen> {
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
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  bool available = false;
  bool checked = false;

  onChanged(String text) {
    setState(() {
      available = text.length >= 4;
      checked = controller.checkPin(pinController.text);
    });
  }

  onDonePressed() {
    controller.finish();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        label: done,
        onPressed: checked && available ? onDonePressed : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Confirme a senha escolhida',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            PinFieldWidget(pinController, onChanged),
            Center(
              child: available && !checked
                  ? const Text('As senhas não conferem, tente novamente')
                  : Container(),
            )
          ]
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: e,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
