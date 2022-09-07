import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment align;
  final FontWeight weight;
  final double height;

  CustomText({
    Key key,
    this.height = 1,
    this.weight = FontWeight.normal,
    this.align,
    this.text,
    this.fontSize = 20,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: align == null ? Alignment.center : align,
        child: Text(
          text,
          style: TextStyle(
            color: color,
            height: height,
            fontSize: fontSize,
            fontWeight: weight,
          ),
        ));
  }
}
