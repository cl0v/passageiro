import 'package:flutter/material.dart';
import 'package:passageiro/src/screens/success.dart';

class UserPreRegistrationSuccessScreen extends StatelessWidget {
  const UserPreRegistrationSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SucessScreen(
      text: 'Cadastrado com sucesso!',
      onPressed: (){
        //TODO: On pre-registration done
      },
    );
  }
}
