import 'package:campusbuddy/widgets/eventimagebox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,30,10,0),
      child: SingleChildScrollView(
        child:Column(
          children: [
            AppBar(
              toolbarHeight: 20,
              backgroundColor: const Color.fromARGB(0, 196, 199, 198),
              elevation: 0,
              flexibleSpace: Row(
                children: [
                  const Text("CampusBuddy",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                  const Spacer(),
                  IconButton(onPressed: ()=>{Scaffold.of(context).openEndDrawer()},icon: const Icon(Icons.segment,color: Colors.white,),),
                ],
              ),
              actions: [Container()],
            ),
            EventImageBox(),
          ],
        )
      ),
    );
  }
}