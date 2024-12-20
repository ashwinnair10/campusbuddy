import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/functions.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/circleavatar.dart';
import 'package:campusbuddy/widgets/eventbox.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class InterestedEvents extends StatefulWidget{
  const InterestedEvents({super.key});

  @override
  State<InterestedEvents> createState() => _InterestedEventsState();
}

class _InterestedEventsState extends State<InterestedEvents> {
  List<Event> __events=events;
  void findInterested(){
    setState(() {
      __events=events.where((s)=>s.interested==true).toList();
    });
  }
  late List<Event> _events=__events;
  void set(String o){
    setState(() {
      if(o!="ALL") {
        _events=__events.where((s)=>s.org==o).toList();
      } 
      else {
        _events=__events;
      }
    });
  }
  void search(String o){
    setState(() {
      if(o!="") {
        _events=eventSearch(__events,o);
      } 
      else {
        _events=__events;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    findInterested();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Searchbar(search),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,10,0,10),
          child:SizedBox(
            width: width,
            height:90,
            child:ListView.builder(
              itemBuilder: (context,index)=>Circleavatar(orgs[index],set),
              itemCount: orgs.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        ListView.builder(itemBuilder: (context, index) {
          return EventBox(_events[index]);
        },itemCount: _events.length,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),padding: EdgeInsets.fromLTRB(0,10,0,0),),
      ],
    );
  }
}