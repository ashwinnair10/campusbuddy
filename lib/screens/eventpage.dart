import 'package:campusbuddy/widgets/eventbox.dart';
import 'package:flutter/material.dart';

class EventPage extends StatefulWidget{
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,30,10,0),
      child: ListView.builder(
        itemBuilder: (context, index) => const EventBox(),
        itemCount: 5,
      ),
    );
  }
}