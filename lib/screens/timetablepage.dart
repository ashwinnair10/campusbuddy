import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget{
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  Widget build(BuildContext context){
    return SingleChildScrollView(padding: EdgeInsets.fromLTRB(0,100,0,100),child: Center(child: Container(child: Text("data"),color: const Color.fromARGB(255, 158, 54, 244),),),);
  }
}