import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/bookvenueform.dart';
import 'package:flutter/material.dart';

class VenueInfoBox extends StatelessWidget{
  bool isdateentered=false;
  Venue venue=def;
  Function func=(){};
  VenueInfoBox(Venue v,bool check,Function f){
    isdateentered=check;
    venue=v;
    func=f;
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
                decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.red,Colors.black])),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: ()=>{
                    showDialog(context: context, builder:(context) {
                      List<VEvent> events=venue.events;
                      return SimpleDialog(
                        children: [
                          if(events.isEmpty)
                          ListTile(
                            title: Text("No events scheduled"),
                          )
                          else
                          for(int i=0;i<events.length;i++)
                          ListTile(
                              title: Text(events[i].name),
                              subtitle: Text("${events[i].date.day}/${events[i].date.month}/${events[i].date.year}  ${events[i].start.hour}:${events[i].start.minute}-${events[i].end.hour}:${events[i].end.minute}"),
                          ),
                        ],
                      );
                    },)
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                    backgroundColor: WidgetStatePropertyAll(Colors.red.shade400),
                    fixedSize: !isdateentered? WidgetStatePropertyAll(Size.fromWidth(width-40)):const WidgetStatePropertyAll(Size.fromWidth(double.infinity)), 
                  ), 

                  child: const Text("See scheduled events",style: TextStyle(color: Colors.white),)                
                ),
                if(isdateentered)
                ElevatedButton(
                  onPressed: ()=>{
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        children: [
                          BookVenueForm(func,venue)
                        ],
                      )
                    ),
                  },
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                    backgroundColor: WidgetStatePropertyAll(Colors.red.shade400),
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