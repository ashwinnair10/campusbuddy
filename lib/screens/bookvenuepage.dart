import 'package:campusbuddy/data/functions.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/widgets/buttons.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:campusbuddy/widgets/venueinfobox.dart';
import 'package:flutter/material.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

class BookVenuePage extends StatefulWidget{
  @override
  State<BookVenuePage> createState() => _BookVenuePageState();
}

class _BookVenuePageState extends State<BookVenuePage> {
  List<Venue> _venues=venues;
  List<Venue> __venues=venues;
  void search(String o){
    setState(() {
      if(o!=""){
        __venues=venueSearch(_venues, o);
      }
      else{
        __venues=_venues;
      }
    });
  }

  void book(String name,Venue v){
    requests.add(Req(v,VEvent(name,"org",start,end,date)));
    v.events.add(VEvent(name,"org",start,end,date));
    setState(() {
      __venues=_venues;
      datetext="Select date";
      timetext="Select time";
      a=false;
      b=false;
      isdateentered=false;
    });
  }

  String datetext="Select date";
  String timetext="Select time";
  bool isdateentered=false;
  bool a=false;
  bool b=false;
  DateTime date=DateTime(0);
  TimeOfDay start=const TimeOfDay(hour: 0, minute: 0);
  TimeOfDay end=const TimeOfDay(hour: 0, minute: 0);
  
  @override
  Widget build(BuildContext context) {
    Future<void> selectDate()async {
      DateTime? picked=await showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
              primary: Colors.red, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            ),
            child: child!,
          );
        },
        context: context,
        firstDate: DateTime(2020),
        lastDate: DateTime(2100),

      );
      if(picked!=null){
        setState(() {
          datetext=picked.toString().split(" ")[0];
          if(datetext!="") {
            a=true;
          }
          isdateentered=a&&b;
          date=picked;
          if(isdateentered) {
            _venues=getVenue(venues, date, start, end);
          }
          __venues=_venues;
        });
      }
    }
    Future<void> selectTime()async {
      TimeRangePicker.show(
        context: context,
        onStartTimeChange: (value) {
          timetext="${value.hour}:${value.minute}-${end.hour}:${end.minute}";
          b=true;
          isdateentered=a&&b;
          start=value;
          if(isdateentered) {
            _venues=getVenue(venues, date, start, end);
          }
          setState(() {
            __venues=_venues;
          });
        },
        onEndTimeChange: (value) {
          timetext="${start.hour}:${start.minute}-${value.hour}:${value.minute}";
          b=true;
          isdateentered=a&&b;
          end=value;
          if(isdateentered) {
            _venues=getVenue(venues, date, start, end);
          }
          setState(() {
            __venues=_venues;
          });
        },
        onSubmitted: (value){
          timetext="${value.startTime?.hour}:${value.startTime?.minute}-${value.endTime?.hour}:${value.endTime?.minute}";
          b=true;
          isdateentered=a&&b;
          start=value.startTime!;
          end=value.endTime!;
          if(isdateentered) {
            _venues=getVenue(venues, date, start, end);
          }
          setState(() {
            __venues=_venues;
          });
        },
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255,27,27,27),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(10,40,10,20),
        child:SingleChildScrollView(child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Searchbar(search),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DateSelectionButton(selectDate,datetext),
                  TimeSelectionButton(selectTime,timetext),
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context,index)=>VenueInfoBox(__venues[index],isdateentered,book),
              itemCount: __venues.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            )
          ],
        ),
      ),),
    );
  }
}