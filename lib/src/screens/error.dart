import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ErrorScreen({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.error,
      // backgroundColor: colorCancel, //TODO: Adicionar cor de fundo
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 100, color: Colors.white),
                const SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headline6
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26, right: 26, bottom: 38),
            child: MaterialButton(
              onPressed: onPressed,
              color: Colors.white,
              // textColor: theme.textTheme, //TODO: Adicionar cor do botão
              child: Text(
                'Voltar',
                style: theme.textTheme.headline6
              ),
            ),
          )
        ],
      ),
    );
  }
}
