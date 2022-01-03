import 'package:flutter/material.dart';
import 'package:passageiro/design_system/themes.dart';
import 'package:passageiro/src/pages/user/pre-registration/controller.dart';
import 'package:passageiro/src/pages/user/pre-registration/provider.dart';

import 'src/pages/user/pre-registration/view.dart';
import 'src/pages/user/registration/provider.dart';
import 'src/routes/routes.dart';

//TODO: Implementar proxima página
//TODO: Implementar página anterior

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: defaultTheme,
      routes: Routes.routes,
      initialRoute: UserPreRegistrationProvider.route,
      // home:  
    );
  }
}
