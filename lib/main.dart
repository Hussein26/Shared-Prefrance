import 'package:flutter/material.dart';
import 'package:shared_prefrance_final/screens/controlling_screen.dart';
import 'package:shared_prefrance_final/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlScreen(),
    );
  }
}


