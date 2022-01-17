import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
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
  late final TextEditingController _tPhone;
  final mask = TextInputMask(mask: ['(99) 9999-9999', '(99) 99999-9999']);
  
  bool terms = false;
  bool polices = false;

  late final UserPreRegistrationController controller;

  @override
  void didChangeDependencies() {
    controller = UserPreRegistrationProvider.of(context)!;
    _tPhone.text = mask.magicMask.getMaskedString(controller.viewModel.phone);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tPhone.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tPhone = TextEditingController();
    super.initState();
  }

  _onTermsPressed() => pushNamed(context, PolicyPrivacyPage.route);

  _onContinue() {
    if (!(terms && polices)) return;
    controller.setPhone(mask.magicMask.clearMask(_tPhone.text));
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
                inputFormatters: [mask],
                keyboardType: TextInputType.phone,
                hintText: '(99) 987654321',
                controller: _tPhone,
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
