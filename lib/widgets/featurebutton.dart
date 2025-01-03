// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/functions.dart';
import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget{
  String str="";
  Icon icon=Icon(Icons.abc);
  Color color=Colors.white;
  FeatureButton(String s){
    str=s;
    if(s=="Check Availability"){
      icon=Icon(Icons.domain,size: width/10,color:const Color.fromARGB(255, 255, 255, 255));
      color=Colors.red;
    }
    if(s=="Book Venue"){
      icon=Icon(Icons.collections_bookmark,size: width/10,color:const Color.fromARGB(255, 255, 255, 255));
      color=Colors.blue;
    }
    if(s=="Directory"){
      icon=Icon(Icons.list,size: width/10,color:const Color.fromARGB(255, 255, 255, 255));
      color=Colors.green;
    }
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=>{
        featurebuttonnavigator(str,context)
      }, 
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.fromLTRB(20,10,20,10)),
        backgroundColor: WidgetStatePropertyAll(color),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius:BorderRadius.circular(10)
          )
        )
      ),
      child:SizedBox(
        width: width/5,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            icon,
            Text(str,style: TextStyle(color:const Color.fromARGB(255, 255, 255, 255),fontSize: 12),maxLines: 2,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}