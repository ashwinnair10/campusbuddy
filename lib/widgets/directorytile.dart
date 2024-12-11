import 'package:flutter/material.dart';

class DirectoryTile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(radius: 35,),
      title: Text("Person Name"),
      subtitle: Text("Designation"),
    );
  }
}