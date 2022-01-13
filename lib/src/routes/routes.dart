import 'package:flutter/material.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/controller.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/provider.dart';
import 'package:passageiro/src/pages/payment/credit_card/create/view.dart';
import 'package:passageiro/src/pages/pdf_reader.dart';
import 'package:passageiro/src/pages/ticket/pay/controller.dart';
import 'package:passageiro/src/pages/ticket/pay/provider.dart';
import 'package:passageiro/src/pages/ticket/pay/view.dart';
import 'package:passageiro/src/pages/user/pre-registration/controller.dart';
import 'package:passageiro/src/pages/user/pre-registration/provider.dart';
import 'package:passageiro/src/pages/user/pre-registration/view.dart';
import 'package:passageiro/src/pages/user/registration/controller.dart';
import 'package:passageiro/src/pages/user/registration/provider.dart';
import 'package:passageiro/src/pages/user/registration/view.dart';
import 'package:passageiro/src/pages/user/repository.dart';
import 'package:passageiro/src/services/http_client.dart';

class Routes {

  static final http = HttpClientService();


  static final Map<String, Widget Function(BuildContext)> routes = {
    PolicyPrivacyPage.route: (context) => const PolicyPrivacyPage(),
    UserPreRegistrationProvider.route: (context) => UserPreRegistrationProvider(
          controller: UserPreRegistrationController(
            repository: UserRepository(
              http: http,
            ),
          ),
          child: const UserPreRegistrationPage(),
        ),
    UserRegistrationProvider.route: (context) => UserRegistrationProvider(
          child: const UserRegistrationPage(),
          controller: UserRegistrationController(
            repository: UserRepository(
              http: http,
            ),
          ),
        ),
    CreditCardCreationProvider.route: (context) => CreditCardCreationProvider(
          child: const CreditCardCreationPage(),
          controller: CreditCardCreationController(),
        ),
    TicketPaymentProvider.route: (context) => TicketPaymentProvider(
          child: const TicketPaymentPage(),
          controller: TicketPaymentController(),
        ),
  };
}
