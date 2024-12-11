// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationBox extends StatefulWidget{
  Notify notification=Notify();
  NotificationBox(Notify n, {super.key}){
    notification=n;
  }

  @override
  State<NotificationBox> createState() => _NotificationBoxState();
}

class _NotificationBoxState extends State<NotificationBox> {
  bool showmore=false;
  Color color=Colors.pink;
  IconData icon=Icons.notifications_active;
  Widget subwidget=Container();
  void getSubWidget(){
    // if(widget.notification.type==NotType.general){
    //   subwidget=Text(widget.notification.content,maxLines: showmore?null:1,style: TextStyle(overflow: showmore?null:TextOverflow.ellipsis),);
    // }
    if(widget.notification.type==NotType.festival){
      subwidget=Row(
        children: [
          Icon(Icons.calendar_month),
          SizedBox(width: 5,),
          Text(DateFormat.yMMMd().format(widget.notification.startDate))
        ],
      );
      color=Colors.red;
      icon=Icons.festival;
    }
    if(widget.notification.type==NotType.fest){
      subwidget=Row(
        children: [
          Icon(Icons.calendar_month),
          SizedBox(width: 5,),
          Text("${DateFormat.yMMMd().format(widget.notification.startDate)} - ${DateFormat.yMMMd().format(widget.notification.endDate)}"),
        ],
      );
      color=Colors.blue;
      icon=Icons.people;
    }
    if(widget.notification.type==NotType.event){
      subwidget=Column(
        children: [
          Row(
            children: [
              Icon(Icons.access_time),
              SizedBox(width: 5,),
              Text("${widget.notification.startTime.format(context)} - ${widget.notification.endTime.format(context)}"),
              Spacer(),
              Icon(Icons.calendar_month),
              SizedBox(width: 5,),
              Text(DateFormat.yMMMd().format(widget.notification.startDate)),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(width: 5,),
              Text(widget.notification.venue)
            ],
          ),
        ],
      );
      color=Colors.green;
      icon=Icons.event;
    }
  }



  @override
  Widget build(BuildContext context) {
    getSubWidget();
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,0,0,10),
      child: ListTile(
        onTap: (){
          setState(() {
            showmore=!showmore;
          });
        },
        leading: Padding(padding: EdgeInsets.fromLTRB(10,10,10,10),child: Icon(icon,size: 30,color: color,),),
        isThreeLine: true,
        title: Text(widget.notification.title,style: TextStyle(fontWeight: FontWeight.bold),),
        subtitle:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.notification.content!="")
            Text(widget.notification.content,maxLines: showmore?null:1,style: TextStyle(overflow: showmore?null:TextOverflow.ellipsis),),
            SizedBox(height: 5,),
            if(showmore||widget.notification.type==NotType.festival)
            subwidget,
            SizedBox(height: 5,),
            if(!showmore&&widget.notification.content!="")
            Text("Tap to show more")
            else if(widget.notification.content!="")
            Text("Tap to show less")
          ],
        ),
        tileColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
        horizontalTitleGap: 10,
      ),
    );
  }
}