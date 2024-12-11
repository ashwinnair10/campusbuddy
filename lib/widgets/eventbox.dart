// ignore_for_file: must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';

class EventBox extends StatefulWidget{
  Event event=Event("","","","","","",false);
  EventBox(Event e, {super.key}){
    event=e;
  }

  @override
  State<EventBox> createState() => _EventBoxState();
}

class _EventBoxState extends State<EventBox> {
  void change(){
    setState((){
      widget.event.inter=!widget.event.inter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(10),
      child: ExpansionTile(
        onExpansionChanged: (value)=>{
          if(value)
          print("expanded"),

        },
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        title:Text(widget.event.title),
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
                          Text(widget.event.date),
                          const Spacer(),
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5,),
                          Text(widget.event.time),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 5,),
                          Text(
                            widget.event.venue,
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
                              backgroundColor: WidgetStatePropertyAll(Colors.red.shade400),
                            ), 
                            child: Row(
                              children: [
                                const Text("Interested",style: TextStyle(color: Colors.white),),
                                const SizedBox(width: 5,),
                                if(!widget.event.inter)
                                const Icon(Icons.star_border_rounded,color: Colors.white,)
                                else
                                const Icon(Icons.star_rounded,color: Colors.white,),
                              ],
                            ),
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: ()=>{},
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),),
                              backgroundColor: WidgetStatePropertyAll(Colors.red.shade400),
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