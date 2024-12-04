import 'package:campusbuddy/widgets/subjecttile.dart';
import 'package:flutter/material.dart';
typedef MyCustomCallback = void Function(String, String, TimeOfDay);
class BuildTimeTable extends StatefulWidget {
  final MyCustomCallback deleteButton;
  final String day;
  final Map<TimeOfDay, String>? subjects;
  @override
  const BuildTimeTable({super.key, required this.deleteButton, required this.day, required this.subjects});

  @override
  State<BuildTimeTable> createState() => _BuildTimeTableState();
}

class _BuildTimeTableState extends State<BuildTimeTable> {
  Map<TimeOfDay, String> sortedsub ={};

  void sortEntries(Map<TimeOfDay,String> sub ){

    List<MapEntry<TimeOfDay, String>> entries = sub.entries.toList();
    entries.sort((a, b) {
    // Compare hour first, then minute
    if (a.key.hour == b.key.hour) {
      return a.key.minute.compareTo(b.key.minute);
    }
    return a.key.hour.compareTo(b.key.hour);
  });

  // Convert back to a map
  sortedsub = Map.fromEntries(entries);
  }

  void _delete(String subject, TimeOfDay time){
    widget.deleteButton(widget.day,subject,time);
  }

  
  @override
  Widget build(BuildContext context) {
    sortEntries(widget.subjects?? {});
    final times = sortedsub.keys.toList(); // List of times
    final subs = sortedsub.values.toList(); // List of subjects
    
    return ListView.builder(
      itemCount: times.length,
      itemBuilder: (context, index) {
        return SubjectTile(
          onButtonPressed: _delete,
          subject: subs[index],         // Pass subject name
          time: times[index]
        );
      },
    );
  }
}
