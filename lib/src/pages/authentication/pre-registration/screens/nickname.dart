import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';
import 'package:passageiro/src/widgets/fab.dart';
import 'package:passageiro/src/widgets/text_field.dart';

import '../controller.dart';
import '../provider.dart';

class NicknameScreen extends StatefulWidget {
  const NicknameScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NicknameScreen> createState() => _NicknameScreenState();
}

class _NicknameScreenState extends State<NicknameScreen> {
  late final TextEditingController _tNick;

  late final UserPreRegistrationController controller;

  @override
  void initState() {
    _tNick = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    controller = UserPreRegistrationProvider.of(context)!;
    _tNick.text = controller.viewModel.nickname;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tNick.dispose();
    super.dispose();
  }

  _onNextPressed() {
    controller.setNickname(_tNick.text);
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
