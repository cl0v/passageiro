import 'package:flutter/material.dart';

import 'controller.dart';

class PaymentRefillProvider extends InheritedWidget {
  const PaymentRefillProvider({
    Key? key,
    required Widget child,
    required this.controller,
  }) : super(key: key, child: child);

  final PaymentRefillController controller;

  static PaymentRefillController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PaymentRefillProvider>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(PaymentRefillProvider oldWidget) {
    return true;
  }
}
