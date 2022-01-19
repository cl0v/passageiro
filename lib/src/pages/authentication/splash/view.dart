import 'package:flutter/material.dart';
import 'package:passageiro/src/pages/authentication/login/view.dart';
import 'package:passageiro/src/pages/authentication/splash/controller.dart';
import 'package:passageiro/src/pages/home/controller.dart';
import 'package:passageiro/src/pages/home/provider.dart';
import 'package:passageiro/src/pages/home/view.dart';
import 'package:passageiro/src/screens/loading.dart';

import '../state.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splash';

  final SplashController controller;

  const SplashScreen({Key? key, required this.controller}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    widget.controller.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<AuthenticationState>(
        initialData: AuthenticationState.loading,
        stream: widget.controller.stream,
        builder: (context, snapshot) {
          return _StateHandler(
            state: snapshot.data,
          );
        },
      ),
    );
  }
}

class _StateHandler extends StatelessWidget {
  const _StateHandler({Key? key, required this.state}) : super(key: key);

  final AuthenticationState? state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case AuthenticationState.loggedIn:
        return HomeProvider(
          controller: HomeController(),
          child: const HomePage(),
        );
      case AuthenticationState.loggedOut:
        return LoginPage();
      case null:
      case AuthenticationState.loading:
        return const LoadingScreen();
    }
  }
}
