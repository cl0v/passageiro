import 'package:flutter/material.dart';

class PaymentRefillClassScreen extends StatelessWidget {
  const PaymentRefillClassScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           Text(
              'Qual cartão deseja recarregar?',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.start,
            ),
            //TODO: Printar as classes disponiveisw 
          ListTile(title: Text('CLASSE 1')),
          ListTile(title: Text('CLASSE 2')),
          ListTile(title: Text('CLASSE 3')),
          ListTile(title: Text('CLASSE 4')),
        ],
      ),
    );
  }
}