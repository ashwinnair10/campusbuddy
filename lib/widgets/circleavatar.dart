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
      child:Column(
          children: [
            InkResponse(
              splashFactory: InkRipple.splashFactory,
              radius: 40,
              child:const CircleAvatar(radius: 30,backgroundColor: Colors.grey,),
              onTap: (){
                func(org);
                print("$org tapped");
              },
            ),
            Text(org,style: const TextStyle(color: Colors.white,),),
          ],
        ),
    );
  }
}