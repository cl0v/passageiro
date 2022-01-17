import 'package:flutter/material.dart';
import 'package:passageiro/src/blocs/enviroment.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    Enviroment.of(context)?.fetchUserClasses(); //TODO: Encontrar as classes ao acessar a home
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
