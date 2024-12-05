import 'package:campusbuddy/screens/eventpage.dart';
import 'package:campusbuddy/screens/homepage.dart';
import 'package:campusbuddy/screens/resourcepage.dart';
import 'package:campusbuddy/screens/timetablepage.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget{
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  
  int index=0;
  Widget currentwidget=const HomePage();
  void getPage(int i){
    setState(() {
      index=i;
      if(i==0){
        currentwidget=const HomePage();
      }
      if(i==1){
        currentwidget=const EventPage();
      }
      if(i==2){
        currentwidget=ResourcePage();
      }
      if(i==3){
        currentwidget=TimetablePage();
      }
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // endDrawerEnableOpenDragGesture: false,
      backgroundColor: const Color.fromARGB(255, 27, 27, 27),
      body: currentwidget,
      // endDrawer: Drawer(
      //   width: MediaQuery.of(context).size.width/1.5,
      //   backgroundColor: const Color.fromARGB(255, 194, 194, 194),
      //   child: ListView(
      //     padding: const EdgeInsets.all(0),
      //     children: [
      //       const DrawerHeader(
      //         decoration: BoxDecoration(color: Color.fromARGB(255, 27, 27, 27),),
      //         child: Text("NITC",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
      //       ),
      //       ListTile(title: const Text("Book a venue"),onTap: ()=>{},splashColor: const Color.fromARGB(255, 172, 172, 172),visualDensity: const VisualDensity(vertical: -4),),
      //       // ListTile(title: const Text("Schedule an event"),onTap: ()=>{},splashColor: const Color.fromARGB(255, 172, 172, 172),visualDensity: const VisualDensity(vertical: -4),),
      //       ListTile(title: const Text("Facility Availabilty "),onTap: ()=>{},splashColor: const Color.fromARGB(255, 172, 172, 172),subtitle: const Text("Check if labs/classes are open"),visualDensity: const VisualDensity(vertical: -4),)
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        elevation: 0,
        enableFeedback: false,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined,color: Colors.white,),label:"Home",activeIcon: Icon(Icons.home,color: Colors.white,)),
          BottomNavigationBarItem(icon: Icon(Icons.event_outlined,color: Colors.white,),label: "Events",activeIcon: Icon(Icons.event,color: Colors.white,)),
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined,color: Colors.white,),label: "Resources",activeIcon: Icon(Icons.book,color: Colors.white,)),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined,color: Colors.white,),label: "Timetable",activeIcon: Icon(Icons.calendar_month,color: Colors.white,)),   
        ],
        unselectedLabelStyle: const TextStyle(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        onTap: (value){
          getPage(value);
          print(value);
        },
        currentIndex: index,
      )
    );
  }
}
