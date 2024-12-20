// ignore_for_file: avoid_print

import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/bookvenuepage.dart';
import 'package:campusbuddy/screens/checkavailabilitypage.dart';
import 'package:campusbuddy/screens/directorypage.dart';
import 'package:flutter/material.dart';

List<Event> eventSearch(List<Event> events,String o){
  Set<Event> set={};
  set.addAll(events.where((s)=>s.name.toLowerCase().contains(o)).toList());
  set.addAll(events.where((s)=>s.venue.name.toLowerCase().contains(o)).toList());
  set.addAll(events.where((s)=>s.org.toLowerCase().contains(o)).toList());
  return set.toList();
}

void featurebuttonnavigator(String s,BuildContext context){
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

double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute/60.0;


List<Venue> getVenue(List<Venue> venues,DateTime date,TimeOfDay start,TimeOfDay end){
  Set<Venue> set={};
  for(int i=0;i<venues.length;i++){
    print("li   pidwde:$start");
    List<int> k=[];
    List<Event> list=venues[i].events;
    if(list.isNotEmpty) {
      print("bleh ${list[0].start}");
    }
    for(int j=0;j<list.length;j++){
      print("date: ${list[j].date.toString()}   date:${date.toString()}");
      if(list[j].date.toString()==date.toString()){
        k.add(j);
      }
    }
    if(k!=[]){
      bool pass=true;
      for(int j=0;j<k.length;j++){
        print("lis: ${toDouble(list[j].start)},${toDouble(list[j].end!)}   pidwde:${toDouble(start)}");
        if(toDouble(list[j].start)>toDouble(end)) {
          continue;
        }
        if(toDouble(start)>toDouble(list[j].end!)) {
          continue;
        } 
        else {
          pass=false;
          break;
        }
      }
      if(pass) {
        set.add(venues[i]);
      }
    }
    else{
      set.add(venues[i]);
    }
  }
  return set.toList();
}

List<Venue> venueSearch(List<Venue> venues,String o){
  Set<Venue> set={};
  set.addAll(venues.where((s)=>s.name.toLowerCase().contains(o)).toList());
  return set.toList();
}

