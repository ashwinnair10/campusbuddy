import 'package:campusbuddy/screens/timetablepage.dart';
import 'package:flutter/material.dart';
typedef MyCustomCallback = void Function(Map<String, Map<TimeOfDay, String>>);
TextEditingController _subjectNameController = TextEditingController();
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  late Map<String, bool> selectedDays;
  late Map<String, TimeOfDay?> selectedTimes;
  void _initializeMap() {
    selectedDays = {
      for (var day in days) day:false
    };
    selectedTimes = {
      for(var day in days) day:null
    };
  }
void showAddCourseModal(BuildContext context, Map<String, Map<TimeOfDay, String>> subjects,MyCustomCallback getMap) {
  _initializeMap();
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Future<void> _selectTime(BuildContext context, String day) async {
            final TimeOfDay? pickedTime = await showTimePicker(
              context: context,
              initialTime: selectedTimes[day] ?? TimeOfDay.now(),
            );
            if (pickedTime != null) {
              setState(() {
                selectedTimes[day] = pickedTime;
              });
            }
          }

          return Container(
            height: 600,
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Add a course",
                      style: TextStyle(fontSize: 22),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(10),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _subjectNameController,
                  decoration: InputDecoration(
                    labelText: 'Subject Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Select Days and Times:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: days.length,
                    itemBuilder: (context, index) {
                      final day = days[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: selectedDays[day],
                                    onChanged: (value) {
                                      setState(() {
                                        if (value == true) {
                                          selectedTimes[day] =
                                              null; // Clear the time when deselected
                                        }

                                        selectedDays[day] =
                                            !selectedDays[day]!; //null check
                                      });
                                    },
                                    checkColor: Colors.black,
                                    // activeColor: Colors.white,
                                  ),
                                  Text(day),
                                ],
                              ),
                              if (selectedDays[day] ?? false)
                                ElevatedButton(
                                  onPressed: () => _selectTime(context, day),
                                  child: Text(
                                    selectedTimes[day] != null
                                        ? selectedTimes[day]!.format(context)
                                        : 'Set Time',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                            ],
                          ),
                          Divider(),
                        ],
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle submission here
                    setState(() {
                      selectedTimes.forEach((day, time) {
                        if (time != null) {
                          if (!subjects.containsKey(day)) {
                            subjects[day] =
                                {}; // Initialize new map if day doesn't exist
                          }
                          // Add the subject and time
                          subjects[day]![time] = _subjectNameController.text;
                        }
                      });
                    });
                    print("$subjects");
                    Navigator.pop(context);
                    _subjectNameController.clear();
                    getMap(subjects);
                  },
                  child: Text('Done'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), // Full-width button
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
