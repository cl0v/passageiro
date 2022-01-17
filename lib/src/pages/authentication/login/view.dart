import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/design_system/colors.dart';
import 'package:passageiro/src/pages/authentication/pre-registration/provider.dart';

//TODO: Refazer essa parte das cores
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
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
            MaterialButton(
              onPressed: () {
                pushNamed(context, UserPreRegistrationProvider.route);
              },
              child: Text(
                'Começar',
                style: GoogleFonts.nunito(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              color: Colors.white,
              textColor: colorPrimary,
            ),
            const SizedBox(height: 31),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Já tem uma conta? '),
                  TextSpan(
                      text: 'Entre aqui',
                      style: GoogleFonts.nunito(
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigator.of(context).pushNamed(Routes.signIn);
                        }),
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
