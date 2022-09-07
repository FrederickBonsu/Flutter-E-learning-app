import 'package:flutter/material.dart';
import 'package:adessua/controllers/controllers.dart';

class LogoGraphicHeader extends StatelessWidget {
  LogoGraphicHeader();
  final ThemeController themeController = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    String _imageLogo = 'assets/img/default.png';
    if (themeController.isDarkModeOn == true) {
      _imageLogo = 'assets/img/default.png';
    }
    return Hero(
      tag: 'App Logo',
      child: CircleAvatar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.transparent,
          radius: 60.0,
          child: ClipOval(
            child: Image.asset(
              _imageLogo,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
          )),

    );
  }
}
