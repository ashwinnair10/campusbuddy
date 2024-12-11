// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:campusbuddy/data/functions.dart';
import 'package:flutter/material.dart';

class FeatureButton extends StatelessWidget{
  String str="";
  Icon icon=Icon(Icons.abc);
  Color color=Colors.white;
  FeatureButton(String s){
    str=s;
    if(s=="Check Availability"){
      icon=Icon(Icons.domain,size: 40,color:const Color.fromARGB(255, 255, 255, 255));
      color=Colors.red;
    }
    if(s=="Book Venue"){
      icon=Icon(Icons.collections_bookmark,size: 40,color:const Color.fromARGB(255, 255, 255, 255));
      color=Colors.blue;
    }
    if(s=="Directory"){
      icon=Icon(Icons.list,size: 40,color:const Color.fromARGB(255, 255, 255, 255));
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
        backgroundColor: WidgetStatePropertyAll(color),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            side: BorderSide.none,
            borderRadius:BorderRadius.circular(10)
          )
        )
      ),
      child:SizedBox(
        width: 80,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [ 
            icon,
            Text(str,style: TextStyle(color:const Color.fromARGB(255, 255, 255, 255)),maxLines: 2,textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}