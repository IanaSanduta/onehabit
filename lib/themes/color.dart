import 'package:flutter/material.dart';

const DarkBlue = const Color(0xFF0F143A);
const LightModeDarkBlue = const Color(0xFF1C2044);
const LightBack = const Color(0xFFFAFAFA);

const LightFont = const Color(0xFFC5C6CA);
const Black = const Color(0xFF000000);
const White = const Color(0xFFFFFFFF);

var BackgroundPurple = const Color.fromRGBO(30, 24, 61, 1);
var BackgroundPurpleSecondary = const Color.fromRGBO(166, 113, 235, 1);
const Purple = const Color(0xFF3C2DB0);
const AccentColor = const Color(0xFFEE8169);
const TextColor = const Color(0xFF000000);

class MyTheme {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      accentColor: AccentColor,
      accentColorBrightness: Brightness.dark,

      primaryColor: Purple,
      primaryColorDark: Purple,
      primaryColorLight: LightBack,
      bottomAppBarColor: Purple,
      //primaryColorBrightness: Brightness.dark,

      buttonTheme: base.buttonTheme.copyWith(
        buttonColor: AccentColor,
        textTheme: ButtonTextTheme.primary,
      ),

      scaffoldBackgroundColor: White,
      cardColor: Purple,
      textSelectionColor: LightBack,
      backgroundColor: White,
    );
  }
}
