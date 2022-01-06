import 'package:flutter/material.dart';
import 'package:passageiro/design_system/themes.dart';
import 'package:passageiro/src/pages/user/pre-registration/controller.dart';
import 'package:passageiro/src/pages/user/pre-registration/provider.dart';

import 'src/pages/user/pre-registration/view.dart';
import 'src/pages/user/registration/provider.dart';
import 'src/routes/routes.dart';


// TODO: Quando vai da página de endereço para as fotos, o teclado dá um bug de overflow na pagina de fotos

//TODO: (Desativar botao)  Adicionar validador
//TODO: (Desativar botao)  Adicionar validador no campo cpf
//TODO: (Desativar botao)  Adicionar validador no campo email
//TODO: (Desativar botao)  Adicionar validador no campo cpf
//TODO: (Desativar botao)  Adicionar validador no campo nome 


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
      initialRoute: UserRegistrationProvider.route,
      // home:  
    );
  }
}
