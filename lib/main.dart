import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/bookvenuepage.dart';
import 'package:flutter/material.dart';
import 'screens/mainscreen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  MyApp({super.key});
  void b=Bleh().bla();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MainScreen(),
    );
  }
}
