import 'package:campusbuddy/data/facilityclass.dart';
import 'package:flutter/material.dart';

class GetSchedulePage extends StatelessWidget {
  final Facility f;
  const GetSchedulePage({super.key, required this.f});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
            ),
            style: IconButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
          title: Text("${f.name} Schedule"),
        ),
        body: SingleChildScrollView(
          child: ListView.builder(
            itemBuilder: (context, index) => Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.black))),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(f.oevents[index].eventName),
                  Text(
                      "${f.oevents[index].stime.format(context)} - ${f.oevents[index].etime.format(context)}")
                ],
              ),
            ),
            itemCount: f.oevents.length,
            shrinkWrap: true,
          ),
        ));
  }
}
