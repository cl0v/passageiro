import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:passageiro/core/utils/navigator.dart';
import 'package:passageiro/design_system/colors.dart';
import 'package:passageiro/src/screens/error.dart';
import 'package:passageiro/src/screens/success.dart';

import 'controller.dart';
import 'provider.dart';
import 'screens/code.dart';
import 'screens/date.dart';
import 'screens/name.dart';
import 'screens/number.dart';
import 'screens/review.dart';
import 'state.dart';

//TODO: Adicionar pagamento direto (Valores necessários para o pagamento)

class CreditCardCreationPage extends StatefulWidget {
  const CreditCardCreationPage({Key? key}) : super(key: key);

  @override
  _CreditCardCreationPageState createState() => _CreditCardCreationPageState();
}

class _CreditCardCreationPageState extends State<CreditCardCreationPage> {
  late final CreditCardCreationController controller;

  @override
  void didChangeDependencies() {
    controller = CreditCardCreationProvider.of(context)!;

    controller.pageController = PageController(
      initialPage: controller.pageIndex,
    );
    controller.add(CreditCardCreationState.idle);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const CreditCardNumberScreen(),
      const CreditCardNameScreen(),
      const CreditCardDateScreen(),
      const CreditCardCreationCodeScreen(),
      const CreditCardReviewScreen(),
      SucessScreen(
        text: 'Cartão cadastrado com sucesso!',
        onPressed: () => pop(
          context,
          controller.cardId,
        ),
      )
    ];
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(elevation: 0, color: colorPrimary),
        scaffoldBackgroundColor: colorPrimary,
        textTheme: TextTheme(
          headline2: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
          subtitle1: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
          bodyText2: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodyText1: GoogleFonts.nunito(
            fontSize: 24,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      child: StreamBuilder<CreditCardCreationState>(
          stream: controller.stream,
          initialData: CreditCardCreationState.idle,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorScreen(
                  text: snapshot.error.toString(),
                  //TODO: Refazer esse cara
                  onPressed: () => controller.tryAgain(context, pop(context)));
            }
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
            return PageView(
              onPageChanged: (index) {
                WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
              },
              physics: const NeverScrollableScrollPhysics(),
              controller: controller.pageController,
              children: pages,
            );
          }),
    );
  }
}
