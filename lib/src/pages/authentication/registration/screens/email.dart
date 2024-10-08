import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';
import '../provider.dart';
import '../validators.dart';

class UserEmailScreen extends StatefulWidget {
  const UserEmailScreen({Key? key}) : super(key: key);

  @override
  State<UserEmailScreen> createState() => _UserEmailScreenState();
}

class _UserEmailScreenState extends State<UserEmailScreen> {
  late final TextEditingController _tEmail;
  late final UserRegistrationController controller;

  @override
  void initState() {
    _tEmail = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    _tEmail.text = controller.viewModel.email;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tEmail.dispose();
    super.dispose();
  }

  _onNextPressed() {
    controller.viewModel.email = _tEmail.text;
    controller.onContinuePressed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        onPressed: emailValidator(_tEmail.text) ? _onNextPressed : null,
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) {
                  setState(() {});
                },
                labelText: 'Email',
                hintText: 'mariaantonieta@gmail.com',
              ),
            )
          ],
        ),
      ),
    );
  }
}
