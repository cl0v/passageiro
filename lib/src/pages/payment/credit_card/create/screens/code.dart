
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';

import '../provider.dart';

class CreditCardCreationCodeScreen extends StatelessWidget {
  const CreditCardCreationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = CreditCardCreationProvider.of(context)!;
    final initalValue = controller.code;
    return CreditCardCodeScreen(
      initialValue: initalValue,
      onBack: controller.previous,
      onSubmit: controller.setCode,
    );
  }
}



class CreditCardCodeScreen extends StatefulWidget {
  const CreditCardCodeScreen({
    Key? key,
    required this.initialValue,
    required this.onSubmit,
    this.onBack,
  }) : super(key: key);

  final String initialValue;
  final Function(String value) onSubmit;
  final VoidCallback? onBack;

  @override
  _CreditCardCodeScreenState createState() => _CreditCardCodeScreenState();
}

class _CreditCardCodeScreenState extends State<CreditCardCodeScreen> {
  final TextEditingController tCode = TextEditingController();

  bool isValid = false;

  @override
  void initState() {
    tCode.text = widget.initialValue;
    isValid = widget.initialValue != '';
    super.initState();
  }

  @override
  void dispose() {
    tCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: widget.onBack,
        ),
      ),
      floatingActionButton: CustomFabExtended(
        label: next,
        onPressed: isValid
            ? () {
                widget.onSubmit.call(tCode.text);
              }
            : null,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Insira o código de segurança do cartão',
              style: textTheme.headline2,
            ),
            const Spacer(
              flex: 1,
            ),
            Row(
              children: [
                const Spacer(),
                Flexible(
                  child: TextField(
                    autofocus: true,
                    controller: tCode,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'\d')),
                      LengthLimitingTextInputFormatter(4)
                    ],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.send,
                    style: textTheme.bodyText1,
                    onChanged: validate,
                  ),
                ),
                const Spacer(),
              ],
            ),
            const Flexible(
              child: SizedBox(
                height: 34,
              ),
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Onde está o código de\nsegurança do meu cartão?',
                  style: textTheme.bodyText2,
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  void validate(String value) {
    if (value.length < 3) {
      setState(() {
        isValid = false;
        return;
      });
    }
    setState(() {
      isValid = value.trim().length > 2;
    });
  }
}
