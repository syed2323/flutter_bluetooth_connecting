import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  static const double size = 16;
  static const Color textColor = Color(0xff505050);


  const Indicator(this.color, this.text, this.isSquare);



  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}