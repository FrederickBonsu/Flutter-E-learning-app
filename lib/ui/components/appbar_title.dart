import 'package:flutter/material.dart';


class AppBarTitle extends StatelessWidget {


  const AppBarTitle({
    Key key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/img/default.png',
          height: 30,
        ),
        SizedBox(width: 2),
        Text(
          'Adessua',
          style: TextStyle(
              fontSize: 22,
              color: Colors.white70,
              fontWeight: FontWeight.w500),

        ),
      ],
    );
  }
}
