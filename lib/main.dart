import 'package:flutter/material.dart';
import 'package:passageiro/design_system/themes.dart';
import 'package:passageiro/src/pages/ticket/pay/provider.dart';
import 'package:passageiro/src/pages/user/pre-registration/controller.dart';
import 'package:passageiro/src/pages/user/pre-registration/provider.dart';
import 'src/routes/routes.dart';
import 'src/services/alice_http_inspector.dart';


//TODO: Testar com versoes mais antigas no android, já que a versao 30 nao funcionou (targe e compile)

//TODO: Error: Quando da error depois de colocar o código, o botao de back da tela de error volta pra a tela de loading

/*//TODO: Criar layout: 
 Página home
 Página de pagamento do cartao
 Página de carga no cartao
*/
/*//TODO:

*/

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
      initialRoute: UserPreRegistrationProvider.route,
      // home:
    );
  }
}
