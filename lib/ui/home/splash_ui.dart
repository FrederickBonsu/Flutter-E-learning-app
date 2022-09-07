
import 'package:flutter/material.dart';

class SplashUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(

            alignment: Alignment.center,
            child: Stack(
              children: [
                Align(
                  child: Image.asset('assets/img/default.png',height:80,width:80,),

                  alignment: Alignment.center,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 10,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.blue.withOpacity(0.5)),
                    ),
                  ),
                )
              ],
            )));
  }
}
