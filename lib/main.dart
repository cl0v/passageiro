import 'package:flutter/material.dart';
import 'package:passageiro/design_system/themes.dart';
import 'src/pages/user/registration/provider.dart';
import 'src/routes/routes.dart';
import 'src/services/alice_http_inspector.dart';
//TODO: Testar com versoes mais antigas no android, já que a versao 30 nao funcionou (targe e compile)
// TODO: Quando vai da página de endereço para as fotos, o teclado dá um bug de overflow na pagina de fotos

//TODO: (Desativar botao)  Adicionar validador

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: alice.getNavigatorKey(),
      theme: defaultTheme,
      routes: Routes.routes,
      initialRoute: UserRegistrationProvider.route,
      // home:
    );
  }
}
