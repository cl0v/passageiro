import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

final defaultTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    // backgroundColor: Colors.grey[50],
    elevation: 0,
  ),
);

final ThemeData purplePageDefaultTheme = ThemeData(
  scaffoldBackgroundColor: colorScaffoldBackground,
  textTheme: const TextTheme(
    button: TextStyle(
      color: colorScaffoldBackground,
    ),
  ),
);

final ThemeData loginPageTheme = purplePageDefaultTheme.copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: colorScaffoldBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.nunito(
        fontSize: 15,
        decoration: TextDecoration.underline,
        fontWeight: FontWeight.bold,
      ),
    ));
