import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/circleavatar.dart';
import 'package:campusbuddy/widgets/eventbox.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class InterestedEvents extends StatefulWidget{
  @override
  State<InterestedEvents> createState() => _InterestedEventsState();
}

class _InterestedEventsState extends State<InterestedEvents> {
  List __events=events;
  void findInterested(){
    setState(() {
      __events=events.where((s)=>s.inter==true).toList();
    });
  }
  late List _events=__events;
  void set(String o){
    setState(() {
      if(o!="ALL")
      _events=__events.where((s)=>s.org==o).toList();
      else
      _events=__events;
    });
  }
  @override
  Widget build(BuildContext context) {
    findInterested();
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
        ListView.builder(itemBuilder: (context, index) {
          return EventBox(_events[index]);
        },itemCount: _events.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),),
      ],
    );
  }
}