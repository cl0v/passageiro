import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/design_system/themes.dart';
import 'package:passageiro/src/pages/authentication/pre-registration/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Theme(data: loginPageTheme, child: const _Body());
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(Routes.menu);
              },
              child: Image.asset(
                'assets/images/logo_title.png',
              ),
            ),
            const Spacer(flex: 3),
            SizedBox(
              width: MediaQuery.of(context).size.width * .85,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  pushNamed(context, UserPreRegistrationProvider.route);
                },
                child: const Text('Começar'),
              ),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Já tem uma conta? '),
                  TextSpan(
                    text: 'Entre aqui',
                    style: Theme.of(context).textTheme.bodyText1,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //TODO: Implement on signIn
                      },
                  ),
                ],
              ),
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}
