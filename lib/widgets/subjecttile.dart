import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final String subject;
  final String time;
  @override
  const SubjectTile({
    super.key,
    required this.subject,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Container(
        // height: 30,
        width: MediaQuery.of(context).size.width * 0.8,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration:
            BoxDecoration(color: const Color.fromARGB(255, 184, 94, 106)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text(subject, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),),
          Text(time, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),)
        ],),
      ),
    );
  }
}
