import 'package:campusbuddy/widgets/allevents.dart';
import 'package:campusbuddy/widgets/calendar.dart';
import 'package:campusbuddy/widgets/interestedevents.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget{
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage>{
  Widget currentwidget=AllEvents();
  int value=0;
  void getWidget(int i){
    setState(() {
      value=i;
      if(i==0){
        currentwidget=AllEvents();
      }
      if(i==1){
        currentwidget=InterestedEvents();
      }
      if(i==2){
        currentwidget=Calendar();
      }
    });
  }
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(10,40,10,0),
      child:Column(
        children: [
          Row(
            children: [
              TextButton(onPressed: ()=>getWidget(0), child: Text("List",style: TextStyle(color: Colors.white,fontWeight: value==0?FontWeight.bold:FontWeight.normal),)),
              TextButton(onPressed: ()=>getWidget(1), child: Text("Interested",style: TextStyle(color: Colors.white,fontWeight: value==1?FontWeight.bold:FontWeight.normal),)),
              TextButton(onPressed: ()=>getWidget(2), child: Text("Calendar",style: TextStyle(color: Colors.white,fontWeight: value==2?FontWeight.bold:FontWeight.normal),)),
            ],
          ),
          currentwidget,
        ],
      ),
    );
  }  
}