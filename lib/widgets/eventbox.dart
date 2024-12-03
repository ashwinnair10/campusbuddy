import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';

class EventBox extends StatelessWidget{
  const EventBox({super.key});

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
        title:Text(title),
        maintainState: true,
        showTrailingIcon: true,
        leading: const CircleAvatar(radius: 10,),
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
                          Text(date),
                          const Spacer(),
                          const Icon(Icons.access_time),
                          const SizedBox(width: 5,),
                          Text(time),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        children: [
                          const Icon(Icons.location_on),
                          const SizedBox(width: 5,),
                          Text(
                            venue,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      
                      // TextButton(onPressed: ()=>{}, child: Text("See more"))
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