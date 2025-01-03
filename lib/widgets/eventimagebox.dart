// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';

class EventImageBox extends StatelessWidget{
  Event event=Event();
  EventImageBox(Event e){
    event=e;
  }

  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.fromLTRB(0,10,0,10),
      child:Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: width-20,
            height: width*0.67,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.red,Colors.black]),
              borderRadius: BorderRadius.circular(10),
            ),
            child:ClipRRect(
              child:Image.network(event.img,fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(
            height: width*0.67,
            width: width*0.67,
            child:Padding(
              padding: EdgeInsets.all(10),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(event.name,style: TextStyle(fontSize: width/10,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,color: Colors.white),maxLines: 1,),
                  Text("by ${event.org}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,overflow: TextOverflow.ellipsis,fontSize: width/25),maxLines: 1,),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}