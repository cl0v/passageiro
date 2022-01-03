import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/pages/user/pre-registration/provider.dart';
import 'package:passageiro/src/pages/user/pre-registration/state.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

class NicknameScreen extends StatelessWidget {
  NicknameScreen({
    Key? key,
  }) : super(key: key);

  final TextEditingController _tNick = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onNextPressed() {
      final controller = UserPreRegistrationProvider.of(context)!;
      controller.setNickname(_tNick.text);
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
              'Como você gostaria de ser chamado?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12.0, 8, 0),
              child: CustomTextFieldWidget(
                controller: _tNick,
                hintText: 'Apelido',
              ),
            )
          ],
        ),
      ),
    );
  }
}
