import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

var content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
class Event{
  String title="",date="",time="",venue="",org="",url="";
  bool inter=false;
  Event(String t,String d,String ti,String v,String o,String u,bool b){
    title=t;
    time=ti;
    date=d;
    venue=v;
    org=o;
    inter=b;
    url=u;
  }
}
List<Event> events=[
  Event(
    "Event1",
    "20/12/24",
    "10:00 A.M",
    "CSED Hall",
    "CSEA",
    "https://img.freepik.com/free-photo/top-view-plastic-objects-arrangement_23-2149439627.jpg",
    true,
  ),
  Event(
    "Event2",
    "18/09/24",
    "03:00 P.M",
    "Auditorium",
    "ECEA",
    "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
    true,
  ),
  Event(
    "Event3",
    "24/02/24",
    "09:00 A.M",
    "Seminar Hall",
    "IEEE",
    "https://img.freepik.com/free-photo/top-view-plastic-objects-arrangement_23-2149439627.jpg",
    false,
  ),
  Event(
    "Event4",
    "21/12/24",
    "10:00 A.M",
    "SSL",
    "CSEA",
    "https://media.istockphoto.com/id/1295274245/photo/random-multicolored-spheres-computer-generated-abstract-form-of-large-and-small-balls-3d.jpg?s=612x612&w=0&k=20&c=q7NOl28YxIIOqKu6em50VlKrg6ISFyVww_nLOCr5W_A=",
    false,
  ),
];
List orgs=[
  "ALL","CSEA","ECEA","IEEE","EEA","MEA","CEA"
];

enum NotType{
  general,
  festival,
  fest,
  event
}

class Notify{
  String title="";
  String content="";
  NotType type=NotType.general;
  DateTime startDate=DateTime(0);
  DateTime endDate=DateTime(0);
  TimeOfDay startTime=TimeOfDay.now();
  TimeOfDay endTime=TimeOfDay.now();
  String venue="";
  //general
  Notify.four(String t,String c,NotType n){
    title=t;
    content=c;
    type=n;
  }
  //festival
  Notify.one(String t,String c,NotType n,DateTime d){
    title=t;
    content=c;
    type=n;
    startDate=d;
  }
  //fest
  Notify.two(String t,String c,NotType n,DateTime s,DateTime e){
    title=t;
    content=c;
    type=n;
    startDate=s;
    endDate=e;
  }
  //event
  Notify.three(String t,String c,NotType n,DateTime d,TimeOfDay s,TimeOfDay e,String v){
    title=t;
    content=c;
    type=n;
    startDate=d;
    startTime=s;
    endTime=e;
    venue=v;
  }
  Notify(){}
}



List<Notify> notifys=[
  Notify.two("Ragam 2025","Cultural Fest of NITC", NotType.fest,DateTime(2025,03,13),DateTime(2025,03,15)),
  Notify.four("Reminder: Fee payment","The last date for paying the tution fees has been extended till 19th December", NotType.general),
  Notify.one("Holi","", NotType.festival,DateTime(2025,03,17)),
  Notify.three("Availability of Terminal-1","Terminal-1 has been reserved for examination of PhD scholars", NotType.event,DateTime(2024,12,12),TimeOfDay(hour: 9, minute: 0),TimeOfDay(hour: 12, minute: 30),"CCC"),
];

List<Appointment> apps=[
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting1',
    color: const Color.fromARGB(255, 33, 243, 121),
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting2',
    color: const Color.fromARGB(255, 243, 110, 33),
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting3',
    color: const Color.fromARGB(255, 236, 33, 243),
    startTimeZone: '',
    endTimeZone: '',
  ),
  Appointment(
    startTime: DateTime.now(),
    endTime: DateTime.now().add(Duration(minutes: 10)),
    subject: 'Meeting4',
    color: const Color.fromARGB(255, 9, 134, 26),
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
  String url="";
  TimeOfDay open=TimeOfDay(hour: 0, minute: 0);
  TimeOfDay close=TimeOfDay(hour: 0, minute: 0);
  List<VEvent> events=[];
  Venue(String n,TimeOfDay o,TimeOfDay c,String u){
    name=n;
    open=o;
    close=c;
    url=u;
  }
  void addEvent(VEvent v){
    events.add(v);
  }
}

Venue ccc=Venue("CCC",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45),"https://claytonglass.co.uk/wp-content/uploads/2019/04/ed-robertson-ON6Xw8XEUQ8-unsplash-1024x683.jpeg");
Venue ssl=Venue("SSL",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45),"https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");
Venue oat=Venue("OAT",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45),"https://claytonglass.co.uk/wp-content/uploads/2019/04/ed-robertson-ON6Xw8XEUQ8-unsplash-1024x683.jpeg");
Venue aud=Venue("Auditorium",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45),"https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");
Venue nsl=Venue("NSL",TimeOfDay(hour: 9,minute: 0),TimeOfDay(hour: 11,minute: 45),"https://www.ft.com/__origami/service/image/v2/images/raw/ftcms%3Af1627e9c-e2ce-4bad-ab16-1ba4028d97c0?source=next-article&fit=scale-down&quality=highest&width=1440&dpr=1");
Venue def=Venue("",TimeOfDay(hour: 0,minute: 0),TimeOfDay(hour: 0,minute: 0),"https://www.letsbuild.com/wp-content/uploads/2023/07/types-of-buildings-construction.jpeg");

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