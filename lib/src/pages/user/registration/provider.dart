import 'package:flutter/material.dart';
import 'package:passageiro/src/pages/user/registration/controller.dart';

class UserRegistrationProvider extends InheritedWidget {
  static const String route = 'Registration';

 const UserRegistrationProvider(
      {Key? key, required Widget child, required this.controller})
      : super(key: key, child: child);

  final UserRegistrationController controller;

  static UserRegistrationController? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<UserRegistrationProvider>()?.controller;
  }

  @override
  bool updateShouldNotify(UserRegistrationProvider oldWidget) {
    return true;
  }
}
