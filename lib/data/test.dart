import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

var content="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
// var title="Lorem ipsum";
// var date="02/12/24";
// var time="10:00 A.M.";
// var venue="CSED Hall";
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