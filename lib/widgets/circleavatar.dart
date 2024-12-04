import 'package:flutter/material.dart';

class Circleavatar extends StatelessWidget{
  String org="";
  Function func=(){};
  Circleavatar(String o,Function f){
    org=o;
    func=f;
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(5,0,5,0),
      child:GestureDetector(

        child:Column(
          children: [
            CircleAvatar(radius: 30,backgroundColor: Colors.grey,),
            Text(org,style: TextStyle(color: Colors.white),),
          ],
        ),
        onTap: (){
          func(org);
          print("${org} tapped");
        },
      ),
    );
  }
}