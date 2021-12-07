import 'package:flutter/material.dart';
// import 'package:machine_eyes_flutter/screens/dashboard_screen.dart';
import 'package:machine_eyes_flutter/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (ctx) => TabScreen()},
    );
  }
}
