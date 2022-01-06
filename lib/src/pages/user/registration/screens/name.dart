import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/user/registration/provider.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';
import '../validators.dart';

class UserNameScreen extends StatefulWidget {
  const UserNameScreen({Key? key}) : super(key: key);

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  late final TextEditingController _tName;
  late final UserRegistrationController controller;

  @override
  void initState() {
    _tName = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tName.dispose();
    super.dispose();
  }

  _onNextPressed() {
    controller.setName(_tName.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        onPressed: nameValidator(_tName.text) ? _onNextPressed : null,
        label: continueNext,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Qual é o seu nome completo?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
              child: CustomTextFieldWidget(
                controller: _tName,
                onChanged: (value) {
                  setState(() {});
                },
                labelText: 'Nome',
                hintText: 'Maria Antonieta',
              ),
            )
          ],
        ),
      ),
    );
  }
}
