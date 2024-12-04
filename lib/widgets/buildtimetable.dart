import 'package:campusbuddy/widgets/subjecttile.dart';
import 'package:flutter/material.dart';

class BuildTimeTable extends StatefulWidget {
  const BuildTimeTable({super.key});

  @override
  State<BuildTimeTable> createState() => _BuildTimeTableState();
}

class _BuildTimeTableState extends State<BuildTimeTable> {
  final Map<String,TimeOfDay> sub = {"English":TimeOfDay(hour: 10, minute: 30),
  "Math": TimeOfDay(hour: 12, minute: 00),
  };
  @override
  Widget build(BuildContext context) {
    final subjects = sub.keys.toList(); // List of subjects
    final times = sub.values.toList(); // List of times
    return ListView.builder(
      itemCount: sub.length,
      itemBuilder: (context, index) {
        return SubjectTile(
          subject: subjects[index],         // Pass subject name
          time: times[index].format(context)
        );
      },
    );
  }
}
