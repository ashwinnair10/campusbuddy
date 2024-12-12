// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:campusbuddy/data/test.dart';
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
      // theme: ThemeData(
      //   primaryColor: Colors.red,
      //   secondaryHeaderColor: Colors.red,
      //   timePickerTheme: TimePickerThemeData(
      //     dialHandColor: Colors.red,
      //     //backgroundColor: Colors.blue,
      //     dayPeriodTextColor: Colors.red,
      //     cancelButtonStyle: ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(color: Colors.red))),
      //     hourMinuteTextColor: Colors.black,
      //     hourMinuteColor: const Color.fromARGB(255, 255, 228, 226),
      //     dialBackgroundColor: Color.fromARGB(255, 255, 228, 226),
      //     helpTextStyle: TextStyle(color: Colors.redAccent),
      //     timeSelectorSeparatorColor: WidgetStatePropertyAll(Colors.red)
      //   )
      // ),
      debugShowCheckedModeBanner: false,
      home:MainScreen(),
    );
  }
}
