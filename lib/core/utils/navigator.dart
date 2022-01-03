import 'package:flutter/material.dart';

// Easy way to navigate between the app.

push(BuildContext context, Widget page, {bool replace = false}) => replace
    ? Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page))
    : Navigator.push(context, MaterialPageRoute(builder: (context) => page));

pushNamed(BuildContext context, String route, {bool replace = false, Object? arguments}) => replace
      ? Navigator.pushReplacementNamed(context, route, arguments: arguments)
      : Navigator.pushNamed(context, route, arguments: arguments);

popUntil(BuildContext context, String route) =>
    Navigator.popUntil(context, ModalRoute.withName(route));

pop(BuildContext context, [result]) => Navigator.pop(context, result);