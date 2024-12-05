import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';

class NotificationBox extends StatelessWidget{
  String title="";
  NotificationBox(String s){
    title=s;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        child:Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.notifications_active_rounded,color: Colors.red,),
                Text(title,maxLines: 1,style: const TextStyle(color: Colors.red,overflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,fontSize: 16),),
              ],
            ),
          Text(content,textAlign: TextAlign.justify,style: const TextStyle(color: Colors.black,fontSize: 14,overflow: TextOverflow.ellipsis),maxLines: 4,),
          ],
        ),
      ),
    );
  }
}