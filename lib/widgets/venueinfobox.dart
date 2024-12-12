// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/bookvenueformpage.dart';
import 'package:campusbuddy/widgets/scheduledeventslist.dart';
import 'package:flutter/material.dart';

class VenueInfoBox extends StatelessWidget{
  bool isdateentered=false;
  Venue venue=def;
  Function func=(){};
  DateTime date=DateTime(0);
  TimeOfDay start=TimeOfDay(hour: 0,minute: 0);
  TimeOfDay end=TimeOfDay(hour: 0,minute: 0);
  VenueInfoBox(Venue v,bool check,Function f,DateTime d,TimeOfDay s,TimeOfDay e){
    isdateentered=check;
    venue=v;
    func=f;
    date=d;
    start=s;
    end=e;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,10,0,0,),
      child:Container(
        width:width,
        //height:width*0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        padding: const EdgeInsets.all(10),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(venue.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,10),
              child: Container(
                width: width,
                height: width*0.67,
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                child:ClipRRect(child:Image.network(venue.url,fit: BoxFit.cover,),borderRadius: BorderRadius.circular(5),),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: ()=>{
                    showDialog(context: context, builder:(context) {
                      return ScheduledEventsList(venue.events);                      
                    },)
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                    fixedSize: !isdateentered? WidgetStatePropertyAll(Size.fromWidth(width-40)):const WidgetStatePropertyAll(Size.fromWidth(double.infinity)), 
                  ), 

                  child: const Text("See scheduled events",style: TextStyle(color: Colors.white),)                
                ),
                if(isdateentered)
                ElevatedButton(
                  onPressed: ()=>{
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>BookVenueForm(func,venue,date,start,end))),
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ), 
                  child: const Text("Book Now",style: TextStyle(color: Colors.white),)                
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}