import 'package:campusbuddy/data/admin.dart';
import 'package:campusbuddy/data/facilityclass.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class CheckAvailabilityPage extends StatefulWidget{
  @override
  State<CheckAvailabilityPage> createState() => _CheckAvailabilityPageState();
}

class _CheckAvailabilityPageState extends State<CheckAvailabilityPage> {
  void search(String c){

  }
  void addeventtester(){
    AdminFeature().addEvent(Facility("SSL",null, null, true),Occupied("en",TimeOfDay(hour: 09, minute: 00), TimeOfDay(hour: 00, minute: 00)));
    print("works");
  }
  @override
  Widget build(BuildContext context) {
    addeventtester();
    return Scaffold(
      body: Column(
        children:[
          Searchbar(search),
          
        ]
      )
    );
  }
}