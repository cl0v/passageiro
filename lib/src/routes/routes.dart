import 'package:flutter/material.dart';
import 'package:passageiro/src/pages/authentication/splash/controller.dart';
import 'package:passageiro/src/pages/authentication/splash/view.dart';
import 'package:passageiro/src/pages/home/controller.dart';
import 'package:passageiro/src/pages/home/provider.dart';
import 'package:passageiro/src/pages/home/view.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/controller.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/provider.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/view.dart';
import 'package:passageiro/src/pages/pdf_reader.dart';
import 'package:passageiro/src/pages/ticket/pay/controller.dart';
import 'package:passageiro/src/pages/ticket/pay/provider.dart';
import 'package:passageiro/src/pages/ticket/pay/view.dart';
import 'package:passageiro/src/pages/authentication/pre-registration/controller.dart';
import 'package:passageiro/src/pages/authentication/pre-registration/provider.dart';
import 'package:passageiro/src/pages/authentication/pre-registration/view.dart';
import 'package:passageiro/src/pages/authentication/registration/controller.dart';
import 'package:passageiro/src/pages/authentication/registration/provider.dart';
import 'package:passageiro/src/pages/authentication/registration/view.dart';
import 'package:passageiro/src/pages/authentication/repository.dart';
import 'package:passageiro/src/services/http_client.dart';
import 'package:passageiro/src/services/token_storage.dart';

class Routes {
  static final http = HttpClientService();
  static final authRepository = AuthenticationRepository(
    http: http,
    tokenStorageService: TokenStorageService(),
  );

  static final Map<String, Widget Function(BuildContext)> routes = {
    PolicyPrivacyPage.route: (context) => const PolicyPrivacyPage(),
    UserPreRegistrationProvider.route: (context) => UserPreRegistrationProvider(
          controller: UserPreRegistrationController(repository: authRepository),
          child: const UserPreRegistrationPage(),
        ),
    UserRegistrationProvider.route: (context) => UserRegistrationProvider(
          child: const UserRegistrationPage(),
          controller: UserRegistrationController(repository: authRepository),
        ),
    CreditCardCreationProvider.route: (context) => CreditCardCreationProvider(
          child: const CreditCardCreationPage(),
          controller: CreditCardCreationController(),
        ),
    TicketPaymentProvider.route: (context) => TicketPaymentProvider(
          child: const TicketPaymentPage(),
          controller: TicketPaymentController(),
        ),
    HomeProvider.route: (context) => HomeProvider(
          child: const HomePage(),
          controller: HomeController(),
        ),
    SplashScreen.route: (context) => SplashScreen(
          controller: SplashController(
            authentication: authRepository,
          ),
        )
  };
}
