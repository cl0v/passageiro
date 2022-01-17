import 'package:flutter/material.dart';

import 'controller.dart';

class UserPreRegistrationProvider extends InheritedWidget {
  static const route = 'Pre-Registration';
  
  const UserPreRegistrationProvider({
    Key? key,
    required Widget child,
    required this.controller,
  }) : super(key: key, child: child);

  final UserPreRegistrationController controller;

  static UserPreRegistrationController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserPreRegistrationProvider>()
        ?.controller;
  }

  @override
  bool updateShouldNotify(UserPreRegistrationProvider oldWidget) {
    return true;
  }
}
