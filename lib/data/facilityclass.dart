import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}

class Facility{
  String name="";
  TimeOfDay? otime, ctime;
  bool open=false;
  List<Occupied> oevents = [];
  Facility (String n, TimeOfDay? ot, TimeOfDay? ct, bool o){
    name=n;
    otime=ot;
    ctime=ct;
    open=o;
  }

  void addOperatingHours(TimeOfDay ot, TimeOfDay ct){
    otime=ot;
    ctime=ct;
  }

  void openFacility(){
    open=true;
  }

  void closeFacility(){
    open=false;
  }

  void addEvent(String en, TimeOfDay st, TimeOfDay et){
    Occupied oe = Occupied(en, st, et);
    oevents.add(oe);
  }

  void sortEvents(){
    oevents.sort((a,b){
      return a.stime.compareTo(b.stime);
    });
  }

  Occupied? searchNext(TimeOfDay t){
    if (oevents.isEmpty) return null;
    sortEvents();
    for (var o in oevents){
      if (o.stime.compareTo(t)<=0 && o.etime.compareTo(t)>0 ){
        return o;
      }
      if (o.stime.compareTo(t)>=0){
        return o;
      }
    }
    return null;
  }
}

class Occupied{
  late String eventName;
  late TimeOfDay stime, etime;
  Occupied(String en, TimeOfDay st, TimeOfDay et){
    eventName=en;
    stime=st;
    etime=et;
  } 
}

Facility ssl = Facility("SSL",null, null, true);
Facility nsl = Facility("NSL",null,null, false);
Facility t1= Facility("CCC Terminal 1", TimeOfDay(hour: 09, minute: 00), TimeOfDay(hour: 00, minute: 00), true);
Facility t2 = Facility("CCC Terminal 2", TimeOfDay(hour: 09, minute: 00), TimeOfDay(hour: 00, minute: 00), true);
Facility t3 = Facility("CCC Terminal 3", TimeOfDay(hour: 09, minute: 00), TimeOfDay(hour: 00, minute: 00), true);
Facility lib = Facility("Library", TimeOfDay(hour: 09, minute: 00), TimeOfDay(hour: 19, minute: 00), true);
Facility mainc = Facility("Main Canteen", TimeOfDay(hour: 07, minute: 00), TimeOfDay(hour: 22, minute: 00), true);
Facility minic = Facility("Mini Canteen", TimeOfDay(hour: 07, minute: 00), TimeOfDay(hour: 22, minute: 00), true);
Facility microc = Facility("Micro Canteen", TimeOfDay(hour: 10, minute: 00), TimeOfDay(hour: 17, minute: 30), true);
Facility gym = Facility("GYM", TimeOfDay(hour: 05, minute: 00), TimeOfDay(hour: 18, minute: 00), true);
Facility coops = Facility("Cooperative Store", TimeOfDay(hour: 09, minute: 00), TimeOfDay(hour: 20, minute: 00), true);

List<Facility> listOfFacilities = [ssl,nsl,t1,t2,t3,lib,mainc,minic,microc, gym, coops];
