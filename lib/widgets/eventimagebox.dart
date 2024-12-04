import 'package:campusbuddy/data/constants.dart';
import 'package:flutter/material.dart';

class EventImageBox extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Padding(padding: EdgeInsets.all(10),
      child:Stack(
        children: [
          Container(
            width: width,
            height: width*0.67,
            color: Colors.blue,
          ),
          Text("EventName",style: TextStyle(fontSize: width/10),)
        ],
        alignment: Alignment.bottomRight,
      ),
    );
  }
}