import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../provider.dart';

class UserCepScreen extends StatelessWidget {
  UserCepScreen({Key? key}) : super(key: key);
  final _tCEP = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _onNextPressed() {
      final controller = UserRegistrationProvider.of(context);
      controller?.setCep(_tCEP.text);
    }

    return Scaffold(
      floatingActionButton: CustomFabExtended(
        onPressed: _onNextPressed,
        label: continueNext,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Qual é o número do seu CPF?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
              child: CustomTextFieldWidget(
                controller: _tCEP,
                  hintText: 'CPF',
              ),
            )
          ],
        ),
      ),
    );
  }
}
