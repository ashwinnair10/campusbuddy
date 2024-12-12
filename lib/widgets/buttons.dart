// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';


class DateSelectionButton extends StatefulWidget{
  Function selectDate=(){};
  String datetext="Select date";
  bool flag=false;
  DateSelectionButton(Function f,String s,bool a){
    selectDate=f;
    datetext=s;
    flag=a;
  }

  @override
  State<DateSelectionButton> createState() => _DateSelectionButtonState();
}

class _DateSelectionButtonState extends State<DateSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (){
        print("tf");
        widget.selectDate();
      },
      onDoubleTap: ()=>widget.selectDate,
      child:Container(
        //color: Colors.red,
        child:Center(
          child: Row(
            children: [
              Icon(Icons.calendar_today,size: 30,color: Colors.blue.shade900),
              SizedBox(width: 10,),
              Text(widget.datetext,style: TextStyle(color:widget.flag?Colors.black:Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}

class TimeSelectionButton extends StatefulWidget{
  Function selectTime=(){};
  String timetext="Select time";
  bool flag=false;
  TimeSelectionButton(Function f,String s,bool b){
    selectTime=f;
    timetext=s;
    flag=b;
  }

  @override
  State<TimeSelectionButton> createState() => _TimeSelectionButtonState();
}

class _TimeSelectionButtonState extends State<TimeSelectionButton> {
  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: (){
        print("tf");
        widget.selectTime();
      },
      onDoubleTap: ()=>widget.selectTime,
      child:Container(
        //color: Colors.red,
        child:Center(
          child: Row(
            children: [
              Icon(Icons.access_time,size: 30,color: Colors.blue.shade900,),
              SizedBox(width: 10,),
              Text(widget.timetext,style: TextStyle(color:widget.flag?Colors.black:Colors.grey),)
            ],
          ),
        ),
      ),
    );
  }
}