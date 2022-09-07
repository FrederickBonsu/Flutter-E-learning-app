import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color dodgerBlue = Color(0xFF4285F4);
  static const Color whiteLilac = Color.fromRGBO(255, 255, 255, 1);
  static const Color blackPearl = Color.fromRGBO(30, 31, 43, 1);
  static const Color brinkPink = Color.fromRGBO(255, 97, 136, 1);
  static const Color juneBud = Color.fromRGBO(186, 215, 97, 1);
  static const Color white = Color.fromRGBO(233, 235, 239, 1);
  static const Color nevada = Colors.white10;
  static const Color ebonyClay = Color.fromRGBO(17, 36, 56, 1.0);
  static const Color littleblack = Colors.black;
  static const Color littlewhite = Color.fromRGBO(218, 225, 231, 1);

  //Font family
  static String font1 = "ProductSans";
  static String font2 = "ProductSans";
  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = dodgerBlue;

  //Background Colors
  static const Color _lightBackgroundColor = littlewhite;
  static const Color _lightBackgroundAppBarColor = ebonyClay;
  static const Color _lightBackgroundSecondaryColor = white;
  static const Color _lightBackgroundAlertColor = blackPearl;
  static const Color _lightBackgroundActionTextColor = white;

  //Text Colors
  static const Color _lightTextColor = Colors.blueGrey;

  //Border Color
  static const Color _lightBorderColor = nevada;

  //Icon Color
  static const Color _lightIconColor = nevada;

  //form input colors
  static const Color _lightBorderActiveColor = _lightPrimaryColor;
  static const Color _lightBorderErrorColor = brinkPink;

  //constants color range for dark theme
  static const Color _darkPrimaryColor = dodgerBlue;

  //Background Colors
  static const Color _darkBackgroundColor = littleblack;

  static const Color _darkBackgroundAppBarColor = ebonyClay;
  static const Color _darkBackgroundAlertColor = blackPearl;
  static const Color _darkBackgroundActionTextColor = white;

  //Text Colors
  static const Color _darkTextColor = Colors.white60;

  //Border Color
  static const Color _darkBorderColor = nevada;

  //Icon Color
  static const Color _darkIconColor = white;
  static const Color _darkInputFillColor = nevada;
  static const Color _darkBorderActiveColor = ebonyClay;
  static const Color _darkBorderErrorColor = brinkPink;

  //text theme for light theme
  static final TextTheme _lightTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 23.0, color: _lightTextColor, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.grey),
    button: TextStyle(
      fontSize: 15.0,
      color: Colors.white,
    ),
    headline6: TextStyle(fontSize: 16.0, color: _lightTextColor),
    subtitle1: TextStyle(fontSize: 16.0, color: _lightTextColor),
    caption: TextStyle(fontSize: 12.0, color: _lightBackgroundAppBarColor),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font1,
    scaffoldBackgroundColor: _lightBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _lightBackgroundAppBarColor,
      iconTheme: IconThemeData(color: _lightTextColor),
      textTheme: _lightTextTheme,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPrimaryColor,
      primaryVariant: _lightBackgroundColor,
      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme: SnackBarThemeData(
        backgroundColor: _lightBackgroundAlertColor,
        actionTextColor: _lightBackgroundActionTextColor),
    iconTheme: IconThemeData(
      color: _lightIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _lightBackgroundAppBarColor),
    textTheme: _lightTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _lightPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      //prefixStyle: TextStyle(color: _lightIconColor),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _lightBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _lightBackgroundSecondaryColor,
      //focusColor: _lightBorderActiveColor,
    ),
  );

  static final TextTheme _darkTextTheme = TextTheme(
    headline1: TextStyle(
        fontSize: 23.0, color: _lightTextColor, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodyText2: TextStyle(fontSize: 14.0, color: Colors.white60),
    button: TextStyle(
        fontSize: 15.0, color: _darkTextColor, fontWeight: FontWeight.w600),
    headline6: TextStyle(fontSize: 16.0, color: _darkTextColor),
    subtitle1: TextStyle(fontSize: 16.0, color: _darkTextColor),
    caption: TextStyle(fontSize: 12.0, color: _darkBackgroundAppBarColor),
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    //primarySwatch: _darkPrimaryColor, //cant be Color on MaterialColor so it can compute different shades.
    accentColor: _darkPrimaryColor, //prefix icon color form input on focus

    fontFamily: font1,
    scaffoldBackgroundColor: _darkBackgroundColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: _darkBackgroundAppBarColor,
      iconTheme: IconThemeData(color: _darkTextColor),
      textTheme: _darkTextTheme,
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPrimaryColor,
      primaryVariant: _darkBackgroundColor,
    ),
    snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white),
        backgroundColor: _darkBackgroundAlertColor,
        actionTextColor: _darkBackgroundActionTextColor),
    iconTheme: IconThemeData(
      color: _darkIconColor, //_darkIconColor,
    ),
    popupMenuTheme: PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _darkPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: InputDecorationTheme(
      prefixStyle: TextStyle(color: _darkIconColor),
      labelStyle: TextStyle(color: nevada),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderActiveColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: _darkBorderErrorColor),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      fillColor: _darkInputFillColor,
      focusColor: _darkBorderActiveColor,
    ),
  );
}
