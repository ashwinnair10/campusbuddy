// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:flutter/material.dart';


class DateSelectionButton extends StatelessWidget{
  Function selectDate=(){};
  String datetext="Select date";
  DateSelectionButton(Function f,String s){
    selectDate=f;
    datetext=s;
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=>selectDate(),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
        backgroundColor: WidgetStatePropertyAll(Colors.red.shade400),
        fixedSize: WidgetStatePropertyAll(Size.fromWidth(width/2.5)),
      ), 
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.calendar_today,color: Colors.white,size: 20,), 
          //SizedBox(width:5),
          Text(datetext,style: const TextStyle(color: Colors.white),),
        ],
      )                
    );
  }
}

class TimeSelectionButton extends StatelessWidget{
  Function selectTime=(){};
  String timetext="Select time";
  TimeSelectionButton(Function f,String s){
    selectTime=f;
    timetext=s;
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ()=>selectTime(),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
        backgroundColor: WidgetStatePropertyAll(Colors.red.shade400),
        fixedSize: WidgetStatePropertyAll(Size.fromWidth(width/2.5)),
      ), 
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(Icons.access_time,color: Colors.white,size: 20,), 
          //SizedBox(width:5),
          Text(timetext,style: const TextStyle(color: Colors.white),),
        ],
      )                
    );
  }
}