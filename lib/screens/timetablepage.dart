import 'package:campusbuddy/widgets/buildtimetable.dart';
import 'package:flutter/material.dart';

class TimetablePage extends StatefulWidget {
  @override
  State<TimetablePage> createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  String _selectedCategory = 'Mon';
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  late Map<String, bool> selectedDays;
  late Map<String, TimeOfDay?> selectedTimes;
  void initializeMap() {
    selectedDays = {
      'Mon': false,
      'Tue': false,
      'Wed': false,
      'Thu': false,
      'Fri': false,
      'Sat': false,
    };
    selectedTimes = {
      'Mon': null,
      'Tue': null,
      'Wed': null,
      'Thu': null,
      'Fri': null,
      'Sat': null,
    };
  }

  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16, 10, 20, 10),
            child: const Text(
              "Your timetable",
              style: TextStyle(
                fontSize: 26,
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
            indent: 16, // Empty space to the leading edge
            endIndent: 16, // Empty space to the trailing edge
          ),
          Expanded(child: BuildTimeTable()),
        ],
      ),
      Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(30),
        child: ElevatedButton(
          onPressed: () {
            initializeMap();
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                  builder: (context, setState) {
                    Future<void> _selectTime(
                        BuildContext context, String day) async {
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
                            decoration: InputDecoration(
                              labelText: 'Subject Name',
                              border: OutlineInputBorder(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Select Days and Times:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: days.length,
                              itemBuilder: (context, index) {
                                final day = days[index];
                                return Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Checkbox(
                                              value: selectedDays[day],
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedDays[day] =
                                                      !selectedDays[
                                                          day]!; //null check
                                                  print(
                                                      "Selected Days:$day - ${selectedDays[day]}");
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
                                            onPressed: () =>
                                                _selectTime(context, day),
                                            child: Text(
                                              selectedTimes[day] != null
                                                  ? selectedTimes[day]!
                                                      .format(context)
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
                              Navigator.pop(context);
                            },
                            child: Text('Done'),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  double.infinity, 50), // Full-width button
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
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
            fontSize: 22,
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
