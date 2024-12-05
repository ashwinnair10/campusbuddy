// ignore_for_file: prefer_final_fields

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/functions.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/circleavatar.dart';
import 'package:campusbuddy/widgets/eventbox.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class AllEvents extends StatefulWidget{
  const AllEvents({super.key});

  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  List<Event> _events=events;
  void set(String o){
    setState(() {
      if(o!="ALL") {
        _events=events.where((s)=>s.org==o).toList();
      } 
      else {
        _events=events;
      }
    });
  }
  void search(String o){
    o=o.toLowerCase();
    setState(() {
      if(o!="") {
        _events=eventSearch(events,o);
      } 
      else {
        _events=events;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Searchbar(search),
        Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10,0),
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
        ListView.builder(itemBuilder: (context, index) => EventBox(_events[index]),itemCount: _events.length,shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),),
      ],
    );
  }
}