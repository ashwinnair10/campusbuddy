import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/notificationbox.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child:CarouselSlider(
        items: [
          for(int i=0;i<notifications.length;i++)
          NotificationBox(notifications[i])
        ],carouselController: CarouselSliderController(),
        options: CarouselOptions(
          padEnds: true,
          autoPlayAnimationDuration: Duration(seconds:10),
          autoPlayCurve: Curves.linear,
          scrollDirection: Axis.vertical,
          autoPlay: true,
          disableCenter: true,
          enlargeCenterPage: false,
          animateToClosest: false,
          pageSnapping: false,
          viewportFraction: 1,
        ),
      ),
    );
  }
}