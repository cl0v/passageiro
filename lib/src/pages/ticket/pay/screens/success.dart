
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passageiro/design_system/colors.dart';

class TicketPaymentSucess extends StatelessWidget {
  const TicketPaymentSucess({Key? key, this.onPressed}) : super(key: key);
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorAccent,
      body: Column(
        children: <Widget>[
          const Spacer(),
          Image.asset(
            'assets/images/success_open_gate.png',
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Catraca liberada,pode\nentrar, boa viagem!',
            textAlign: TextAlign.center,
            style: GoogleFonts.nunito(  //TODO: Tirar a fonte daqui
                color: colorTextDark,  //TODO: Tirar a cor daqui
                fontSize: 22,
                fontWeight: FontWeight.w800),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 26,
            ),
            child: MaterialButton(
              color: Colors.white,
              textColor: colorTextDark, //TODO: Tirar a cor daqui
              child: Text(
                'Concluído',
                style: GoogleFonts.nunito(fontWeight: FontWeight.w800),
              ),
              onPressed: onPressed,
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
