// ignore_for_file: prefer_final_fields

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/circleavatar.dart';
import 'package:campusbuddy/widgets/eventbox.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class AllEvents extends StatefulWidget{
  @override
  State<AllEvents> createState() => _AllEventsState();
}

class _AllEventsState extends State<AllEvents> {
  List _events=events;
  void set(String o){
    setState(() {
      if(o!="ALL")
      _events=events.where((s)=>s.org==o).toList();
      else
      _events=events;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Searchbar(),
        Padding(
          padding: EdgeInsets.fromLTRB(10,20,10,0),
          child:Container(
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
        ListView.builder(itemBuilder: (context, index) => EventBox(_events[index]),itemCount: _events.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
      ],
    );
  }
}