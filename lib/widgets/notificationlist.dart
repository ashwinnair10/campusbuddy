import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/notificationbox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: width,
    //   height: 200,
    //   child:CarouselSlider(
    //     items: [
    //       for(int i=0;i<notifys.length;i++)
    //       NotificationBox(notifys[i])
    //     ],carouselController: CarouselSliderController(),
    //     options: CarouselOptions(
    //       aspectRatio: 3,
    //       padEnds: true,
    //       autoPlayAnimationDuration: Duration(seconds:10),
    //       autoPlayCurve: Curves.linear,
    //       scrollDirection: Axis.vertical,
    //       autoPlay: true,
    //       disableCenter: true,
    //       enlargeCenterPage: false,
    //       animateToClosest: false,
    //       pageSnapping: false,
    //       viewportFraction: 1,
    //     ),
    //   ),
    // );
    return ListView.builder(padding: EdgeInsets.all(0),itemBuilder: (context,i)=>NotificationBox(notifys[i]),shrinkWrap: true,itemCount: notifys.length,physics: NeverScrollableScrollPhysics(),);
  }
}