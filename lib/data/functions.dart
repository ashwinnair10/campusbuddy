import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/bookvenuepage.dart';
import 'package:campusbuddy/screens/checkavailabilitypage.dart';
import 'package:campusbuddy/screens/directorypage.dart';
import 'package:flutter/material.dart';

List<Event> eventSearch(List<Event> events,String o){
  List<Event> searchList=[];
  searchList.addAll(events.where((s)=>s.title.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.date.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.time.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.venue.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.org.toLowerCase().contains(o)).toList());
  return searchList;
}

void circlebuttonnavigator(String s,BuildContext context){
  if(s=="Check Availability"){
    Navigator.push(context,MaterialPageRoute(builder: (context) => CheckAvailabilityPage(),));
  }
  if(s=="Book Venue"){
    Navigator.push(context,MaterialPageRoute(builder: (context) => BookVenuePage(),));
  }
  if(s=="Directory"){
    Navigator.push(context,MaterialPageRoute(builder: (context) => DirectoryPage(),));
  }
}