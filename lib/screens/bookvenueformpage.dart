// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookVenueForm extends StatefulWidget{
  Function func=(){};
  Venue venue=def;
  DateTime date=DateTime(0);
  TimeOfDay start=TimeOfDay(hour: 0,minute: 0);
  TimeOfDay end=TimeOfDay(hour: 0,minute: 0);
  BookVenueForm(Function f,Venue v,DateTime d,TimeOfDay s,TimeOfDay e){
    func=f;
    venue=v;
    date=d;
    start=s;
    end=e;
  }

  @override
  State<BookVenueForm> createState() => _BookVenueFormState();
}

class _BookVenueFormState extends State<BookVenueForm> {
  TextEditingController event=TextEditingController();

  TextEditingController request=TextEditingController();

  // BookVenueForm.setDate(DateTime d){
  bool einvalid=false;
  bool rinvalid=false;

  void test(){
    setState(() {
      if(event.text.isEmpty){
        einvalid=true;
      }
      else{
        einvalid=false;
      }
      if(request.text.isEmpty){
        rinvalid=true;
      }
      else{
        rinvalid=false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: EdgeInsets.all(20),
    //   child:Column(
    //     children: [
    //        TextField(
    //         controller: controller,
    //         decoration: InputDecoration(
    //           border: OutlineInputBorder(
                
    //           ),
    //           enabledBorder: OutlineInputBorder(
                
    //           ),
    //           label: Text("Enter event name"),
    //           floatingLabelBehavior: FloatingLabelBehavior.never,
    //         ),
            
    //       ),
    //       ElevatedButton(
    //         onPressed: (){
    //           if(controller.text=="")
    //           return;
    //           func(controller.text,venue);
    //           FocusScope.of(context).unfocus();
    //           Navigator.pop(context);
    //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sent request"),));
    //         },
    //         child: Text("Send request"),
    //       )
    //     ],
    //   )
    // );
    print("${widget.date} ${widget.start} ${widget.end} wtf is wrong");
    return Scaffold(
      backgroundColor: Color.fromARGB(255,235,235,235),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10,40,10,20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: event,
                decoration: InputDecoration(
                  errorText: einvalid? 'Field cannot be empty':null,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  hintText: "Enter event name",
                  hintStyle: TextStyle(color: Colors.grey),

                ),
                // minLines: 8,
                // maxLines: 100,
              ),
              SizedBox(height: 20,),
              Container(
                width: width,
                //height: width/2,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.event,size: 30,color: Colors.purple.shade800,),
                        SizedBox(width: 10,),
                        Text(DateFormat.MMMEd().format(widget.date),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                        Spacer(),
                        Icon(Icons.access_time,size: 30,color: Colors.purple.shade800,),
                        SizedBox(width: 10,),
                        Text("${widget.start.format(context)}-${widget.end.format(context)}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),                       
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.location_on,size: 30,color: Colors.purple.shade800,),
                        SizedBox(width: 10,),
                        Text(widget.venue.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: request,
                decoration: InputDecoration(
                  errorText: rinvalid? 'Field cannot be empty':null,
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red,),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none
                  ),
                  hintText: "Enter details regarding the event",
                  hintStyle: TextStyle(color: Colors.grey),

                ),
                minLines: 20,
                maxLines: 100,
              ),
              ElevatedButton(
                onPressed: ()=>{
                  test(),
                  if(!rinvalid&&!einvalid)
                  showDialog(
                    context: context, 
                    builder: (context)=>AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text("Submit request?"),
                      content: Text("Please verify all details carefully"),
                      actions: [
                        TextButton(
                          onPressed: (){
                            widget.func(event.text,widget.venue);
                            FocusScope.of(context).unfocus();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("sent request"),),);
                          }, 
                          child: Text("Submit")
                        ),
                      ],
                    )
                  ),
                }, 
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.purple.shade800),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  fixedSize: WidgetStatePropertyAll(Size.fromWidth(width))
                ),
                child: Text("Submit request",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}