import 'package:campusbuddy/data/facilityclass.dart';
import 'package:campusbuddy/widgets/facilityschedule.dart';
import 'package:flutter/material.dart';

class Facilitybox extends StatefulWidget {
  final Facility f;
  const Facilitybox({super.key, required this.f});

  @override
  State<Facilitybox> createState() => _FacilityboxState();
}

class _FacilityboxState extends State<Facilitybox> {
  @override
  Widget build(BuildContext context) {
    Occupied? nextEvent = widget.f.searchNext(TimeOfDay.now());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(2),
          elevation: 0,
          overlayColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
        ),
        onPressed: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) => GetSchedulePage(f: widget.f)));
        },
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 231, 218, 218),
              border: Border.all(color: Colors.black)),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.f.name),
                  Text(
                    widget.f.open ? "OPEN" : "CLOSED",
                    style: TextStyle(color: widget.f.open ? Colors.green : Colors.red),
                  )
                ],
              ),
              Row(
                children: [
                  widget.f.otime != null && widget.f.ctime != null
                      ? Text(
                          "${ widget.f.otime!.format(context)} - ${ widget.f.ctime!.format(context)}")
                      : Text(""),
                ],
              ),
              Row(
                children: [
                  (nextEvent != null)
                      ? Text(
                          "Next: ${nextEvent.eventName} (${nextEvent.stime.format(context)} - ${nextEvent.etime.format(context)})")
                      : Text(""),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}