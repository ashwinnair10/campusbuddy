import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/circlebutton.dart';
import 'package:campusbuddy/widgets/eventimagebox.dart';
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
          children: [
            AppBar(
              toolbarHeight: 20,
              backgroundColor: const Color.fromARGB(0, 196, 199, 198),
              elevation: 0,
              flexibleSpace: Row(
                children: [
                  const Text("CampusBuddy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  const Spacer(),
                  IconButton(onPressed: ()=>{},icon: const Icon(Icons.account_circle,color: Colors.white,),),
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
              ),
            ),
            Divider(color: Colors.grey.shade600,),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleButton("Check Availability"),
                CircleButton("Book Venue"),
                CircleButton("Directory"),
              ],
            ),
          ],
        )
      ),
    );
  }
}