import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';
class EventRegistrationPage extends StatefulWidget{
  Event event=Event();
  EventRegistrationPage(Event e){
    event=e;
  }

  @override
  State<EventRegistrationPage> createState() => _EventRegistrationPageState();
}

class _EventRegistrationPageState extends State<EventRegistrationPage> {
  TextEditingController name=TextEditingController();

  TextEditingController rollno=TextEditingController();

  TextEditingController branch=TextEditingController();

  List<TextEditingController> list=[TextEditingController(),TextEditingController()];

  bool ninvalid=false;

  bool rinvalid=false;

  bool binvalid=false;

  Widget teamdetails=Container();

  void fetchWidget(){
    if(widget.event.noOfParticpiants>1){
      List<TextEditingController> names=[];
      List<TextEditingController> rollnos=[];
      List<TextEditingController> branches=[];
      for(int i=0;i<widget.event.noOfParticpiants;i++){
        names.add(TextEditingController());
        rollnos.add(TextEditingController());
        branches.add(TextEditingController());
      }
      List<Widget> test=[];
      for(int i=0;i<widget.event.noOfParticpiants-1;i++){
        test.add(
          Column(
            children: [
              TextField(
                controller: names[i],
                decoration: InputDecoration(
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
                  hintText: "Enter team member ${i+1} - name",
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text("Team Member ${i+1} - Name"),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: rollnos[i],
                decoration: InputDecoration(
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
                  hintText: "Enter team member ${i+1} - roll number",
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text("Team Member ${i+1} - Roll Number"),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: branches[i],
                decoration: InputDecoration(
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
                  hintText: "Enter team member ${i+1} - branch",
                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                  label: Text("Team Member ${i+1} - Branch"),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 20,),
            ],
          )
        );
      }
      print("helo");
      teamdetails=Column(
        children: test
      );
    }
  }

  // bool check(){
  //   setState(() {
  //     ninvalid=name.text.isEmpty?true:false;
  //     rinvalid=rollno.text.isEmpty?true:false;
  //     binvalid=branch.text.isEmpty?true:false;
  //   });
  //   return ninvalid||rinvalid||binvalid;
  // }

  @override
  Widget build(BuildContext context) {
    name.text=Student().name;
    rollno.text=Student().rollno;
    branch.text=Student().branch;
    fetchWidget();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 235, 235),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10,40,10,20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Registration details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 20,),
            TextField(
              controller: name,
              readOnly: true,
              decoration: InputDecoration(
                // errorText: ninvalid? 'Field cannot be empty':null,
                // errorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red,),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // focusedErrorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red,),
                //   borderRadius: BorderRadius.circular(10),
                // ),
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
                hintText: "Enter your name",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text("Name"),
                hintStyle: TextStyle(color: Colors.grey),

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: rollno,
              readOnly: true,
              decoration: InputDecoration(
                // errorText: rinvalid? 'Field cannot be empty':null,
                // errorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red,),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // focusedErrorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red,),
                //   borderRadius: BorderRadius.circular(10),
                // ),
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
                hintText: "Enter your roll number",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text("Roll Number"),
                hintStyle: TextStyle(color: Colors.grey),

              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: branch,
              readOnly: true,
              decoration: InputDecoration(
                // errorText: binvalid? 'Field cannot be empty':null,
                // errorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red,),
                //   borderRadius: BorderRadius.circular(10),
                // ),
                // focusedErrorBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.red,),
                //   borderRadius: BorderRadius.circular(10),
                // ),
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
                hintText: "Enter your branch",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: Text("Branch"),
                hintStyle: TextStyle(color: Colors.grey),

              ),
            ),
            SizedBox(height: 20,),
            teamdetails,
            if(widget.event.regfee>0)
            ElevatedButton(
              onPressed: (){}, 
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: WidgetStatePropertyAll(Colors.purple.shade600),
                fixedSize: WidgetStatePropertyAll(Size.fromWidth(width-20))
              ),
              child: Text("Pay registration fees",style: TextStyle(color: Colors.white)),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                backgroundColor: WidgetStatePropertyAll(Colors.purple.shade600),
                fixedSize: WidgetStatePropertyAll(Size.fromWidth(width-20))
              ),
              onPressed: (){
                // if(check()==false)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registered successfully")));
                
              },
              child:Text(widget.event.regfee>0?"Finish":"Register",style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}