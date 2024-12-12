import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ScheduledEventsList extends StatelessWidget{
  List<VEvent> events=[];
  ScheduledEventsList(List<VEvent> e){
    events=e;
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      //title: Text("Upcoming events"),
      insetPadding: EdgeInsets.fromLTRB(10,100,10,100),
      child:Container(
        padding: EdgeInsets.all(10),
        child:Column(
          children: [
            if(events.isEmpty)
            const ListTile(
              title: Text("No events scheduled"),
            )
            else
            for(int i=0;i<events.length;i++)
            ListTile(
                title: Text(events[i].name),
                subtitle: Text("${DateFormat.MMMEd().format(events[i].date)}  ${events[i].start.format(context)}-${events[i].end.format(context)}"),
            ),
          ],
        ),
      ),
    );
  }
}