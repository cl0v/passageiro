import 'package:flutter/material.dart';

import 'controller.dart';

class TicketPaymentProvider extends InheritedWidget {
  static const String route = '/ticket/pay';

  const TicketPaymentProvider(
      {Key? key, required Widget child, required this.controller})
      : super(key: key, child: child);

  final TicketPaymentController controller;

  static TicketPaymentController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TicketPaymentProvider>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(TicketPaymentProvider oldWidget) {
    return true;
  }
}
