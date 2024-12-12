import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/functions.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:campusbuddy/screens/bookvenueformpage.dart';
import 'package:campusbuddy/widgets/buttons.dart';
import 'package:campusbuddy/widgets/searchbar.dart';
import 'package:campusbuddy/widgets/venueinfobox.dart';
import 'package:flutter/material.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';
import 'package:intl/intl.dart';
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
          datetext=DateFormat.MMMEd().format(picked);
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
          timetext="${value.format(context)}-${end.format(context)}";
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
          timetext="${start.format(context)}-${value.format(context)}";
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
          timetext="${value.startTime?.format(context)}-${value.endTime?.format(context)}";
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
      backgroundColor: const Color.fromARGB(255,235,235,235),
      body:Padding(
        padding: const EdgeInsets.fromLTRB(10,40,10,20),
        child:SingleChildScrollView(child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Searchbar(search),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,10,0,0),
              child:Container(
                width: width,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  //border: Border.all(color: Colors.grey,width: 2)
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DateSelectionButton(selectDate,datetext,a),
                    VerticalDivider(thickness: 0,width: 0,color: Colors.grey,),
                    TimeSelectionButton(selectTime,timetext,b),
                  ],
                ),
              ),
            ),
            ListView.builder(
              itemBuilder: (context,index)=>VenueInfoBox(__venues[index],isdateentered,book,date,start,end),
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