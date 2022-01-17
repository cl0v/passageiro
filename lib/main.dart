import 'package:flutter/material.dart';
import 'package:passageiro/design_system/themes.dart';
import 'package:passageiro/src/blocs/enviroment.dart';
import 'src/pages/authentication/splash/view.dart';
import 'src/routes/routes.dart';
import 'src/services/alice_http_inspector.dart';

// TODO: Adicionar sistema de login automatico
// O login irá verificar se tem algum token de sessão salvo
// e irá olhar a data de expiração dele

//TODO: Ta rolando um bug que quando o user ja tem o número cadastrado,
// pode cadastrar com outro num
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
    return Enviroment(
      bloc: EnviromentBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        navigatorKey: alice.getNavigatorKey(),
        theme: defaultTheme,
        routes: Routes.routes,
        initialRoute: SplashScreen.route,
        // home:
      ),
    );
  }
}
