import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget{
  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  Widget build(BuildContext context){
    return SingleChildScrollView(padding: EdgeInsets.fromLTRB(0,100,0,100),child: Center(child: Container(child: Text("data"),color: const Color.fromARGB(255, 54, 244, 86),),),);
  }
}