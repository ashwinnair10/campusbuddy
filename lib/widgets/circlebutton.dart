import 'package:campusbuddy/data/functions.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget{
  String str="";
  CircleButton(String s){
    str=s;
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>{
        circlebuttonnavigator(str,context)
      }, 
      child:SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            CircleAvatar(radius: 40,backgroundColor: Colors.grey,), 
            SizedBox(height: 5,),
            Text(str,style: TextStyle(color:Colors.white),maxLines: 2,textAlign: TextAlign.center,),
            Spacer(),
          ],
        ),
        width: 80,
        height: 130,
      ),
    );
  }
}