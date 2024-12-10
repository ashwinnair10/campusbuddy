import 'package:campusbuddy/data/facilityclass.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

var content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
class Event{
  String title="",date="",time="",venue="",org="";
  bool inter=false;
  Event(String t,String d,String ti,String v,String o,bool b){
    title=t;
    time=ti;
    date=d;
    venue=v;
    org=o;
    inter=b;
  }
}
List<Event> events=[
  Event(
    "Event1",
    "20/12/24",
    "10:00 A.M",
    "CSED Hall",
    "CSEA",
    true,
  ),
  Event(
    "Event2",
    "18/09/24",
    "03:00 P.M",
    "Auditorium",
    "ECEA",
    true,
  ),
  Event(
    "Event3",
    "24/02/24",
    "09:00 A.M",
    "Seminar Hall",
    "IEEE",
    false,
  ),
  Event(
    "Event4",
    "21/12/24",
    "10:00 A.M",
    "SSL",
    "CSEA",
    false,
  ),
];
List orgs=[
  "ALL","CSEA","ECEA","IEEE","EEA","MEA","CEA"
];

List notifications=[
  "Exam scheduled in CCC T1",
  "SSL reserved for Training",
  "Tathva 2024",
];

List<Appointment> apps=[
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting1',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting2',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting3',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting4',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting5',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting6',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting7',
    color: Colors.blue,
    startTimeZone: '',
    endTimeZone: '',
  ),
];
class Ap extends CalendarDataSource{
  Ap(List<Appointment> l){
    appointments=l;
  }
}

class VEvent{
  String name="";
  String org="";
  TimeOfDay start=TimeOfDay(hour: 0, minute: 0);
  TimeOfDay end=TimeOfDay(hour: 0, minute: 0);
  DateTime date=DateTime(0000);
  VEvent(String n,String o,TimeOfDay s,TimeOfDay e,DateTime d){
    name=n;
    org=o;
    start=s;
    end=e;
    date=d;
  }
}
class Venue{
  String name="";
  TimeOfDay open=TimeOfDay(hour: 0, minute: 0);
  TimeOfDay close=TimeOfDay(hour: 0, minute: 0);
  List<VEvent> events=[];
  Venue(String n,TimeOfDay o,TimeOfDay c){
    name=n;
    open=o;
    close=c;
  }
  void addEvent(VEvent v){
    events.add(v);
  }
}

Venue ccc=Venue("CCC",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45));
Venue ssl=Venue("SSL",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45));
Venue oat=Venue("OAT",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45));
Venue aud=Venue("Auditorium",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45));
Venue nsl=Venue("NSL",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45));
Venue def=Venue("",TimeOfDay(hour: 0,minute: 0),TimeOfDay(hour: 0,minute: 0));

VEvent vdef=VEvent("","",TimeOfDay(hour: 0, minute: 0),TimeOfDay(hour: 0,minute: 0),DateTime(0));

class Bleh{
  void bla(){
    ccc.addEvent(
      VEvent(
        "EventName",
        "Orgy",
        TimeOfDay(hour: 17,minute: 30),
        TimeOfDay(hour: 20,minute: 0),
        DateTime(2024,12,12)
      )
    );
    ccc.addEvent(
      VEvent(
        "EventName",
        "Orgy",
        TimeOfDay(hour: 17,minute: 30),
        TimeOfDay(hour: 20,minute: 0),
        DateTime(2024,12,12)
      )
    );
    oat.addEvent(
      VEvent(
        "EventName",
        "Orgy",
        TimeOfDay(hour: 09,minute: 30),
        TimeOfDay(hour: 12,minute: 30),
        DateTime(2024,12,11)
      )
    );
    nsl.addEvent(
      VEvent(
        "EventName",
        "Orgy",
        TimeOfDay(hour: 15,minute: 30),
        TimeOfDay(hour: 19,minute: 0),
        DateTime(2024,12,13)
      )
    );
    aud.addEvent(
      VEvent(
        "EventName",
        "Orgy",
        TimeOfDay(hour: 15,minute: 30),
        TimeOfDay(hour: 19,minute: 0),
        DateTime(2024,12,13)
      )
    );
  }
}



List<Venue> venues=[ccc,ssl,nsl,oat,aud];


class Req{
  Venue venue=def;
  VEvent event=vdef;
  Req(Venue v,VEvent ve){
    venue=v;
    event=ve;
  }
}

List<Req> requests=[];