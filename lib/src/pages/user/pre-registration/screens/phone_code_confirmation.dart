import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/user/pre-registration/provider.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';

class UserPhoneCodeConfirmationScreen extends StatefulWidget {
  const UserPhoneCodeConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<UserPhoneCodeConfirmationScreen> createState() =>
      _UserPhoneCodeConfirmationScreenState();
}

class _UserPhoneCodeConfirmationScreenState
    extends State<UserPhoneCodeConfirmationScreen> {
  late final TextEditingController _codeController;
  late final UserPreRegistrationController controller;

  bool available = false;

  @override
  void initState() {
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserPreRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }

  _onEnterPressed(BuildContext context) {
    controller.verifyCode(context, _codeController.text).call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        label: enter,
        onPressed: available ? () => _onEnterPressed(context) : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Confirme o código que enviamos por SMS',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
              child: CustomTextFieldWidget(
                controller: _codeController,
                maxLength: 4,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                ],
                onChanged: (s) {
                  setState(() {
                    available = s.length >= 4;
                  });
                },
              ),
              // PinCodeTextField(
              //   controller: _controller,
              //   length: 4,
              //   animationType: AnimationType.fade,
              //   backgroundColor: Theme.of(context).primaryColor,
              //   keyboardType: TextInputType.number,
              //   inputFormatters: [
              //     FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
              //   ],
              //   textStyle: Theme.of(context).textTheme.headline6,
              //   autoDismissKeyboard: true,
              //   beforeTextPaste: (text) => true,
              //   dialogConfig: DialogConfig(
              //     dialogTitle: 'Colar',
              //     affirmativeText: 'Colar',
              //     negativeText: 'Cancelar',
              //     dialogContent: 'Deseja colar esse código: ',
              //   ),
              //   pinTheme: PinTheme(
              //     borderWidth: 1,
              //     // activeColor: Colors.white,
              //     // inactiveColor: Colors.white,
              //     selectedColor: Theme.of(context).colorScheme.secondary,
              //     shape: PinCodeFieldShape.underline,
              //     fieldWidth: 28,
              //   ),
              //   appContext: context,
              //   onChanged: (String value) {
              //     debugPrint(value);
              //   },
              // ),
            )
          ],
        ),
      ),
    );
  }
}
