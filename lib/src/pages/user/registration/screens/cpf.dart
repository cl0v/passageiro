import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/user/registration/provider.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';

class UserCPFScreen extends StatefulWidget {
  const UserCPFScreen({Key? key}) : super(key: key);

  @override
  State<UserCPFScreen> createState() => _UserCPFScreenState();
}

class _UserCPFScreenState extends State<UserCPFScreen> {

  late final TextEditingController _tCpf;
  late final UserRegistrationController controller;

  @override
  void initState() {
    _tCpf = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tCpf.dispose();
    super.dispose();
  }

  _onNextPressed() {
    controller.setCpf(_tCpf.text);
  }

  @override
  Widget build(BuildContext context) {
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
                controller: _tCpf,
                labelText: 'CPF',
              ),
            )
          ],
        ),
      ),
    );
  }
}
