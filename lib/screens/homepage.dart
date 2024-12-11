import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/profilepage.dart';
import 'package:campusbuddy/widgets/circlebutton.dart';
import 'package:campusbuddy/widgets/eventimagebox.dart';
import 'package:campusbuddy/widgets/notificationlist.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,30,10,0),
      child: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              toolbarHeight: 20,
              backgroundColor: const Color.fromARGB(0, 196, 199, 198),
              elevation: 0,
              flexibleSpace: Row(
                children: [
                  const Text("CampusBuddy",style: TextStyle(color: Color.fromARGB(255, 0, 137, 172),fontWeight: FontWeight.bold,fontSize: 20),),
                  const Spacer(),
                  IconButton(onPressed: ()=>{Navigator.push(context,MaterialPageRoute(builder: (context)=>ProfilePage()))},icon: const Icon(Icons.account_circle,color: Colors.black,),padding: EdgeInsets.all(0),),
                ],
              ),
              actions: [Container()],
            ),
            CarouselSlider(
              items: [
                for(int i=0;i<events.length;i++)
                EventImageBox(events[i])
              ],
              options: CarouselOptions(
                autoPlay: true,
                disableCenter: true,
                enlargeCenterPage: false,
                viewportFraction:  1,
              ),
            ),
            // Divider(color: Colors.grey.shade600,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleButton("Check Availability"),
                CircleButton("Book Venue"),
                CircleButton("Directory"),
              ],
            ), 
            // Divider(color: Colors.grey.shade600,),
            Padding(
              padding: EdgeInsets.fromLTRB(0,30,0,10),
              child: Text("Feed",style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0),fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            NotificationList(),
          ],
        )
      ),
    );
  }
}