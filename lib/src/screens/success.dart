import 'package:flutter/material.dart';
import 'package:passageiro/core/intl/strings.dart';

class SucessScreen extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const SucessScreen({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorAccent,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: MaterialButton(
            color: Colors.white,
            // textColor: colorTextDark,
            child: Text(
              done,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            onPressed: onPressed,
          )),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: 18),
                Container(
                  height: 62,
                  width: 62,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      // color: Theme.of(context),
                      width: 4,
                    ),
                  ),
                  child: Center(
                    child: Image.asset('assets/images/check.png'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
