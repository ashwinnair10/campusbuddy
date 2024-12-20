import 'package:flutter/material.dart';
import 'package:campusbuddy/data/test.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          title: Text("Your Profile"),
        ),
        body: Column(
          children: [
            CircleAvatar(backgroundColor: Colors.grey,radius: 80,),
            Center(
              child: Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.01),
                width: MediaQuery.of(context).size.width - MediaQuery.of(context).size.width*0.2,
                height: MediaQuery.of(context).size.height - 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Icon(
                            Icons.person,
                            size: 44,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text("${user["name"]}"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Icon(
                            Icons.calendar_view_day_outlined,
                            size: 44,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Roll Number",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text("${user["roll"]}"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Icon(
                            Icons.school,
                            size: 44,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Batch",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text("${user["batch"]}"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Icon(
                            Icons.apartment_sharp,
                            size: 44,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Branch",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text("${user["branch"]}"),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Icon(
                            Icons.email,
                            size: 44,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                            Text("${user["email"]}"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
