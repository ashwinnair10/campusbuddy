import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class CheckAvailabiltyPage extends StatefulWidget{
  @override
  State<CheckAvailabiltyPage> createState() => _CheckAvailabiltyPageState();
}

class _CheckAvailabiltyPageState extends State<CheckAvailabiltyPage> {
  void search(String c){

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Searchbar(search),
          
        ]
      )
    );
  }
}