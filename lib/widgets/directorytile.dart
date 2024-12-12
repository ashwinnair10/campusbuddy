import 'package:flutter/material.dart';

class DirectoryTile extends StatefulWidget{
  @override
  State<DirectoryTile> createState() => _DirectoryTileState();
}

class _DirectoryTileState extends State<DirectoryTile> {
  bool isexpanded=false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          contentPadding: EdgeInsets.all(10),
          minVerticalPadding:5,
          title: Text("Person Name"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Designation"),
              Row(
                children: [
                  Icon(Icons.mail),
                  SizedBox(width: 5,),
                  Text("email@nitc.ac.in"),
                ],
              )
            ],
          ),
          leading: CircleAvatar(radius: 30,backgroundColor: Colors.lightBlue,),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}