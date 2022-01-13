import 'package:flutter/material.dart';

import 'controller.dart';

class CreditCardCreationProvider extends InheritedWidget {
  static const String route = '/cards/create';

  const CreditCardCreationProvider({
    Key? key,
    required Widget child,
    required this.controller,
  }) : super(key: key, child: child);

  final CreditCardCreationController controller;

  static CreditCardCreationController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CreditCardCreationProvider>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(CreditCardCreationProvider oldWidget) {
    return true;
  }
}
