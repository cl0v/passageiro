import 'package:flutter/material.dart';

import 'controller.dart';

class HomeProvider extends InheritedWidget {
  static const route = 'Home';
  const HomeProvider({Key? key, required Widget child, required this.controller})
      : super(key: key, child: child);

  final HomeController controller;

  static HomeController? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeProvider>()?.controller;
  }

  @override
  bool updateShouldNotify(HomeProvider oldWidget) {
    return true;
  }
}
