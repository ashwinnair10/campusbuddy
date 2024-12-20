// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/eventregistrationpage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventBox extends StatefulWidget{
  Event event=Event();
  EventBox(Event e, {super.key}){
    event=e;
  }

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  void change(){
    setState((){
      widget.event.interested=!widget.event.interested;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.fromLTRB(0,0,0,10),
      child: ExpansionTile(
        onExpansionChanged: (value)=>{
          if(value)
          print("expanded"),

        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        title:Text(widget.event.name),
        maintainState: true,
        showTrailingIcon: true,
        leading: const CircleAvatar(radius: 10,backgroundColor: Colors.grey,),
        initiallyExpanded: true,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            width: width,
            child: Column(
              children: [
                Container(
                  height: width*0.5,
                  width: width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red,Colors.black])
                  ),
                  child:Image.network(widget.event.img,fit: BoxFit.cover,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child:Column(
                    children: [
                      Text(
                        content,
                        style: const TextStyle(
                          // overflow: TextOverflow.ellipsis,
                        ),
                        //maxLines: 3,
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Icon(Icons.date_range),
                          const SizedBox(width: 5,),
                          Text(DateFormat.MMMEd().format(widget.event.date)),
                          const Spacer(),
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5,),
                          Text(widget.event.start.format(context)),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 5,),
                          Text(
                            widget.event.venue.name,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: ()=>{
                              change()
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                              backgroundColor: WidgetStatePropertyAll(Colors.blue),
                            ), 
                            child: Row(
                              children: [
                                const Text("Interested",style: TextStyle(color: Colors.white),),
                                const SizedBox(width: 5,),
                                if(!widget.event.interested)
                                const Icon(Icons.star_border_rounded,color: Colors.white,)
                                else
                                const Icon(Icons.star_rounded,color: Colors.white,),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: ()=>{
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>EventRegistrationPage(widget.event)))
                            },
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                              backgroundColor: WidgetStatePropertyAll(Colors.blue),
                            ), 
                            child: const Text("Register Now",style: TextStyle(color: Colors.white),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}