import 'package:flutter/material.dart';

enum PerformanceRange { POOR, AVERAGE, GOOD }

class Utils{

  static String currentShed = "";

  static Color colorEfficiency = Colors.green;
  static Color colorShortStop = Colors.orange;
  static Color colorLongStop = Colors.red;
  static Color colorWarp = Colors.orange;
  static Color colorWeft = Colors.blue[900];
  static Color colorLeno = Colors.purple;
  static Color colorOther = Colors.deepOrange;
  static Color colorTotal = Colors.black;
  static Color colorMechanical = Colors.blueGrey;
  static Color colorElectrical = Colors.red[900];
  static Color colorKnotting = Colors.green[600];
  static Color colorArticle = Colors.green[900];
  static Color colorProgramNotAvailable = Colors.red;
  static Color colorShutdown = Colors.redAccent;
  static Color colorOthers = Colors.teal[500];




  static int currentTabPos = 0;

  static int apiHittingDelayInSeconds = 10;

  static checkRange(double value) {
    if (value >= 0 && value < 80) {
      return PerformanceRange.POOR;
    }

    if (value >= 80 && value < 90) {
      return PerformanceRange.AVERAGE;
    }

    if (value >= 90 && value <= 100) {
      return PerformanceRange.GOOD;
    }
  }
}
