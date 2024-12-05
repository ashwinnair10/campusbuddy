import 'package:flutter/material.dart';
import 'admin.dart';

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



