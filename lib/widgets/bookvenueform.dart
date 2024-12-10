// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';

class BookVenueForm extends StatelessWidget{
  TextEditingController controller=TextEditingController();
  Function func=(){};
  Venue venue=def;
  BookVenueForm(Function f,Venue v){
    func=f;
    venue=v;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child:Column(
        children: [
           TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                
              ),
              enabledBorder: OutlineInputBorder(
                
              ),
              label: Text("Enter event name"),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
            
          ),
          ElevatedButton(
            onPressed: (){
              func(controller.text,venue);
              Navigator.pop(context);
              SnackBar(content: Text("sent request"),);
            },
            child: Text("Send request"),
          )
        ],
      )
    );
  }
}