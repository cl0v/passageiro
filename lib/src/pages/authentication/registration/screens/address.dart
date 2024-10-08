import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';
import '../provider.dart';
import '../validators.dart';

class UserAddressScreen extends StatefulWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  State<UserAddressScreen> createState() => _UserAddressScreenState();
}

class _UserAddressScreenState extends State<UserAddressScreen> {
  late final TextEditingController _tStreet;
  late final TextEditingController _tNumber;
  late final TextEditingController _tComplement;

  late final UserRegistrationController controller;

  @override
  void initState() {
    _tStreet = TextEditingController();
    _tNumber = TextEditingController();
    _tComplement = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserRegistrationProvider.of(context)!;
    _tStreet.text = controller.viewModel.address.street;
    _tNumber.text = controller.viewModel.address.number;
    _tComplement.text = controller.viewModel.address.complement;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tStreet.dispose();
    super.dispose();
  }

  Function()? _onNextPressed() {
    controller.setAddress(
      _tStreet.text,
      _tNumber.text,
      _tComplement.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        onPressed: streetValidator(_tStreet.text) && numValidator(_tNumber.text)
            ? _onNextPressed
            : null,
        label: continueNext,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Text(
              'Qual o seu endereço?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            ...[
              CustomTextFieldWidget(
                controller: _tStreet,
                labelText: 'Rua',
                onChanged: (_) {
                  setState(() {});
                },
                hintText: 'Rua Antonio Freitas da Silva',
              ),
              CustomTextFieldWidget(
                controller: _tNumber,
                labelText: 'Número',
                onChanged: (_) {
                  setState(() {});
                },
                keyboardType: TextInputType.number,
                hintText: 'Nº 234',
              ),
              CustomTextFieldWidget(
                controller: _tComplement,
                labelText: 'Complemento',
                hintText: 'Apto 504',
              ),
            ]
                .map((e) => Padding(
                      padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
                      child: e,
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
