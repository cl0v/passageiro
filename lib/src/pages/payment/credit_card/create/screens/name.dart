import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';

import '../controller.dart';
import '../provider.dart';

class CreditCardNameScreen extends StatefulWidget {
  const CreditCardNameScreen({Key? key}) : super(key: key);

  @override
  _CreditCardNameScreenState createState() => _CreditCardNameScreenState();
}

class _CreditCardNameScreenState extends State<CreditCardNameScreen> {
  final TextEditingController tName = TextEditingController();

  late final CreditCardCreationController controller;

  bool isValid = false;

  @override
  void didChangeDependencies() {
    controller = CreditCardCreationProvider.of(context)!;
    tName.text = controller.name;
    isValid = controller.name != '';
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    tName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      floatingActionButton: CustomFabExtended(
        label: next,
        onPressed: isValid ? () => controller.setName(tName.text) : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => controller.previous(),
        ),
      ),
      body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Insira o nome como está escrito no cartão',
                  style: theme.textTheme.headline2),
              const Spacer(
                flex: 1,
              ),
              TextField(
                controller: tName,
                autofocus: true,
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.send,
                decoration:
                    const InputDecoration(hintText: 'Maria Antonieta Jesus'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'\D*'))
                ],
                style: theme.textTheme.bodyText1,
                onChanged: (value) {
                  setState(() {
                    isValid = tName.text.length > 4;
                  });
                },
              ),
              const Flexible(
                child: SizedBox(
                  height: 34,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
            ],
          )),
    );
  }
}
