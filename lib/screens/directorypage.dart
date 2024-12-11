import 'package:campusbuddy/widgets/directorytile.dart';
import 'package:flutter/material.dart';

class DirectoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context,i)=>DirectoryTile(),itemCount: 3,),
    );
  }
}