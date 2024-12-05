import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class Calendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height*0.8,
      child:SfCalendar(
        allowAppointmentResize: false,
        allowDragAndDrop: false,
        // allowViewNavigation: true,
        view: CalendarView.month,
        // allowedViews: [
          // CalendarView.day,
          // CalendarView.month,
          // CalendarView.schedule,
          // CalendarView.timelineDay,
          // CalendarView.timelineMonth,
          // CalendarView.timelineWeek,
          // CalendarView.timelineWorkWeek,
          // CalendarView.week,
          // CalendarView.workWeek
        // ],
        monthViewSettings: MonthViewSettings(
          showAgenda: true,
          agendaViewHeight: -1,
        ),
        dataSource: Ap(apps),
        backgroundColor: Colors.white,
        cellBorderColor: Colors.red.shade400,
        selectionDecoration: BoxDecoration(border: Border.all(color: Colors.red,width: 3)),
        showDatePickerButton:false,
        showNavigationArrow: true,
        todayHighlightColor: Colors.red.shade400,
        showTodayButton: true,
        viewNavigationMode: ViewNavigationMode.snap,
        viewHeaderStyle: ViewHeaderStyle(),
        headerStyle: CalendarHeaderStyle(textStyle: TextStyle(color: Colors.black),backgroundColor: Colors.red.shade400),
      ),
    );
  }
}