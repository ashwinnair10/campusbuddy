import 'package:campusbuddy/data/constants.dart';
import 'package:flutter/material.dart';

class EventImageBox extends StatelessWidget{
  const EventImageBox({super.key});

  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(10),
      child:Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: width,
            height: width*0.67,
            color: Colors.blue,
          ),
          Text("EventName",style: TextStyle(fontSize: width/10),)
        ],
      ),
    );
  }
}