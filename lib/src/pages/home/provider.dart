import 'package:flutter/material.dart';

class HomeProvider extends InheritedWidget {
  static const route = 'Home';
  const HomeProvider({Key? key, required Widget child})
      : super(key: key, child: child);

  static HomeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeProvider>();
  }

  @override
  bool updateShouldNotify(HomeProvider oldWidget) {
    return true;
  }
}
