import 'package:campusbuddy/data/test.dart';

List<Event> eventSearch(List<Event> events,String o){
  List<Event> searchList=[];
  searchList.addAll(events.where((s)=>s.title.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.date.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.time.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.venue.toLowerCase().contains(o)).toList());
  searchList.addAll(events.where((s)=>s.org.toLowerCase().contains(o)).toList());
  return searchList;
}