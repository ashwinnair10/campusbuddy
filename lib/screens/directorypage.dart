import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/widgets/directorytile.dart';
import 'package:flutter/material.dart';

class DirectoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255,235,235,235),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10,40,10,20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: width,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Emergency contacts",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.local_hospital,color: Colors.red,),
                      SizedBox(width: 5,),
                      Text("NITC Health Centre"),
                      Spacer(),
                      Text("9999191919"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.medical_services,color:Colors.red),
                      SizedBox(width: 5,),
                      Text("NITC Ambulance"),
                      Spacer(),
                      Text("9999191919"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.local_police,color: Colors.blue.shade900,),
                      SizedBox(width: 5,),
                      Text("Police Station"),
                      Spacer(),
                      Text("9999191919"),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.fire_truck,color: Colors.red,),
                      SizedBox(width: 5,),
                      Text("Fire Station"),
                      Spacer(),
                      Text("9999191919"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Deans",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ListView.builder(itemBuilder: (context,i)=>DirectoryTile(),itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.fromLTRB(0,10,0,10),),
            Text("HODs",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ListView.builder(itemBuilder: (context,i)=>DirectoryTile(),itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.fromLTRB(0,10,0,10),),
            Text("Professors",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ListView.builder(itemBuilder: (context,i)=>DirectoryTile(),itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.fromLTRB(0,10,0,10),),
            Text("Wardens",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ListView.builder(itemBuilder: (context,i)=>DirectoryTile(),itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),padding: EdgeInsets.fromLTRB(0,10,0,10),),
          ],
        ),
      ),
    );
  }
}