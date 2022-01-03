import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../provider.dart';

class UserEmailScreen extends StatelessWidget {
  UserEmailScreen({Key? key}) : super(key: key);
  final TextEditingController _tEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onNextPressed() {
      final controller = UserRegistrationProvider.of(context);
      controller?.setEmail(_tEmail.text);
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
              'Qual é o seu e-mail?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
              child: CustomTextFieldWidget(
                controller: _tEmail,
                hintText: 'Email',
              ),
            )
          ],
        ),
      ),
    );
  }
}
