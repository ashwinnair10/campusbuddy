import 'package:campusbuddy/data/facilityclass.dart';
import 'package:campusbuddy/widgets/facilitybox.dart';
import 'package:campusbuddy/widgets/searchbar1.dart';
import 'package:flutter/material.dart';

class CheckAvailabilityPage extends StatefulWidget {
  @override
  State<CheckAvailabilityPage> createState() => _CheckAvailabilityPageState();
}

class _CheckAvailabilityPageState extends State<CheckAvailabilityPage> {
  List<Facility> _fac = listOfFacilities;
  void search(String c) {
    c = c.toLowerCase();
    setState(() {
      _fac = [];
      _fac.addAll(listOfFacilities
          .where((s) => s.name.toLowerCase().contains(c))
          .toList());
    });
  }

  void addevents() {
    ssl.addEvent("Exam", TimeOfDay(hour: 09, minute: 00),
        TimeOfDay(hour: 12, minute: 00));
    ssl.addEvent("Lab", TimeOfDay(hour: 14, minute: 00),
        TimeOfDay(hour: 17, minute: 00));
    t1.addEvent("Exam", TimeOfDay(hour: 11, minute: 30),
        TimeOfDay(hour: 14, minute: 00));
    t3.addEvent("Lab", TimeOfDay(hour: 14, minute: 00),
        TimeOfDay(hour: 17, minute: 00));
    nsl.addEvent("Workshop", TimeOfDay(hour: 20, minute: 30),
        TimeOfDay(hour: 22, minute: 00));
  }

  @override
  Widget build(BuildContext context) {
    addevents();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 40, 5, 20),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  Searchbar1(search),//created new searchbar=>searchbar1.dart for this page
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) => Facilitybox(f: _fac[index]),
              itemCount: _fac.length,
              shrinkWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
