// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Circleavatar extends StatelessWidget{
  String org="";
  Function func=(){};
  Circleavatar(String o,Function f, {super.key}){
    org=o;
    func=f;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5,0,5,0),
      child:InkResponse(
        splashFactory: InkRipple.splashFactory,
        radius: 40,
        child:Container(
          width: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(97, 7, 156, 255),
          ),
          child: Center(
            child: Text(org),
          ),
        ),
        onTap: (){
          func(org);
          print("$org tapped");
        },
      ),
    );
  }
}