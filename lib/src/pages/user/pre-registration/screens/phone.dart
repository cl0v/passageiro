import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/src/pages/pdf_reader.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';
import '../controller.dart';
import '../provider.dart';

class UserPhoneScreen extends StatefulWidget {
  const UserPhoneScreen({Key? key}) : super(key: key);

  @override
  State<UserPhoneScreen> createState() => _UserPhoneScreenState();
}

class _UserPhoneScreenState extends State<UserPhoneScreen> {
  final MaskTextInputFormatter _phoneMaskFormatter = MaskTextInputFormatter(
      mask: "(##) #####-####", filter: {"#": RegExp(r'[0-9]')});

  bool terms = false;
  bool polices = false;

  late final UserPreRegistrationController controller;

  @override
  void didChangeDependencies() {
    controller = UserPreRegistrationProvider.of(context)!;
    super.didChangeDependencies();
  }


  _onTermsPressed() => pushNamed(context, PolicyPrivacyPage.route);

  _onContinue() {
    if (!(terms && polices)) return;
    controller.setPhone(_phoneMaskFormatter.getUnmaskedText());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        label: continueNext,
        onPressed: terms && polices ? _onContinue : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Qual é o seu número de celular?  ',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 12),
              child: CustomTextFieldWidget(
                inputFormatters: [_phoneMaskFormatter],
                keyboardType: TextInputType.phone,
                hintText: '(99) 987654321',
              ),
            ),
            CheckboxListTile(
              value: terms,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  terms = value ?? terms;
                });
              },
              dense: true,
              title: TextButton(
                onPressed: _onTermsPressed,
                child: const Text(
                  'Concordo com os Termos de Serviço da Buzzão.',
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            CheckboxListTile(
              value: polices,
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (value) {
                setState(() {
                  polices = value ?? polices;
                });
              },
              dense: true,
              title: TextButton(
                onPressed: _onTermsPressed,
                child: const Text(
                  'Concordo com as Políticas de Privacidade.',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
