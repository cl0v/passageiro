import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';
import '../provider.dart';
import '../validators.dart';

class UserCepScreen extends StatefulWidget {
  const UserCepScreen({Key? key}) : super(key: key);

  @override
  State<UserCepScreen> createState() => _UserCepScreenState();
}

class _UserCepScreenState extends State<UserCepScreen> {
  late final TextEditingController _tCEP;

  late final UserRegistrationController controller;

  final mask = TextInputMask(mask: ['99999-999']);

  @override
  void initState() {
    _tCEP = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    _tCEP.text = mask.magicMask.getMaskedString(controller.viewModel.cep);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tCEP.dispose();
    super.dispose();
  }

  _onNextPressed() {
    controller.setCep(mask.magicMask.clearMask(_tCEP.text));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        onPressed: cepValidator(_tCEP.text) ? _onNextPressed : null,
        label: continueNext,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Qual é o número do seu CEP?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
              child: CustomTextFieldWidget(
                controller: _tCEP,
                keyboardType: TextInputType.number,
                onChanged: (_) async {
                  if (cepValidator(_tCEP.text)) {
                    await controller.fetchAddress(_tCEP.text);
                  }else{
                    setState(() {});
                  }
                },
                labelText: 'CEP',
                inputFormatters: [mask],
              ),
            )
          ],
        ),
      ),
    );
  }
}
