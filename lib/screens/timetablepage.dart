import 'package:campusbuddy/widgets/bottomsheet.dart';
import 'package:campusbuddy/widgets/buildtimetable.dart';
import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
 
  String _selectedCategory = 'Mon';
  
  Map<String, Map<TimeOfDay, String>> subjects = {};
  

  void _delete(String day, String subject, TimeOfDay time) {
    setState(() {
      if (subjects[day] != null) {
        subjects[day]!.remove(time);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void getMap(Map<String, Map<TimeOfDay, String>> sub) {
      setState(() {
        subjects = sub;
      });
    }
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 30, 20, 10),
            child: const Text(
              "Your timetable",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 247, 243, 243),
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryButton('Mon'),
                _buildCategoryButton('Tue'),
                _buildCategoryButton('Wed'),
                _buildCategoryButton('Thurs'),
                _buildCategoryButton('Fri'),
                _buildCategoryButton('Sat'),
              ],
            ),
          ),
          Divider(
            color: Colors.grey, // Color of the line
            thickness: 1, // Thickness of the line
            indent: 10, // Empty space to the leading edge
            endIndent: 10, // Empty space to the trailing edge
          ),
          Expanded(
              child: BuildTimeTable(
            deleteButton: _delete,
            day: _selectedCategory,
            subjects: subjects[_selectedCategory],
          )),
        ],
      ),
      Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(30),
        child: ElevatedButton(
          onPressed: () {
              showAddCourseModal(context, subjects, getMap);
          },
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 249, 249, 249),
            size: 40,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 184, 94, 106),
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(10),
          ),
        ),
      )
    ]);
  }

  Widget _buildCategoryButton(String category) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
      child: TextButton(
        onPressed: () {
          if (mounted) {
            setState(() {
              _selectedCategory = category;
            });
          }
        },
        style: ButtonStyle(
          overlayColor:
              WidgetStateProperty.all(const Color.fromARGB(40, 208, 208, 208)),
        ),
        child: Text(
          category,
          style: TextStyle(
            fontSize: 20,
            fontWeight: _selectedCategory == category
                ? FontWeight.w800
                : FontWeight.w500,
            color: _selectedCategory == category
                ? const Color.fromARGB(255, 247, 243, 243)
                : const Color.fromARGB(255, 71, 73, 73),
          ),
        ),
      ),
    );
  }
}
