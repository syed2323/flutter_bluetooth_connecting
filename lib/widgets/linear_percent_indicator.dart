import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

Widget linearPercentIndicator(BuildContext context,double percent){
  return LinearPercentIndicator(

    animation: true,
    lineHeight: 16.0,
    animationDuration: 1000,
    percent: percent/100,
    center: Text("$percent%", style: TextStyle(color: Colors.white),),
    linearStrokeCap: LinearStrokeCap.roundAll,
    progressColor: Colors.green,
  );
}