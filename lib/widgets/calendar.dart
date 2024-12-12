import 'package:campusbuddy/data/constants.dart';
import 'package:campusbuddy/data/test.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
class Calendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(0),
      width: width,
      height: height*0.8,
      child:ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(
          
          showAgenda: true,
          agendaViewHeight: -1,
        ),
        dataSource: Ap(apps),
        backgroundColor: Colors.white,
        cellBorderColor: Colors.purple,
        selectionDecoration: BoxDecoration(border: Border.all(color: Colors.purple,width: 3)),
        showDatePickerButton:false,
        showNavigationArrow: true,
        todayHighlightColor: Colors.green,
        showTodayButton: true,
        viewNavigationMode: ViewNavigationMode.snap,
        headerHeight: 50,
        viewHeaderHeight: 50,
        viewHeaderStyle: ViewHeaderStyle(
          dayTextStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
        ),
        headerStyle: CalendarHeaderStyle(textStyle: TextStyle(color: Colors.white),backgroundColor: Colors.purple),
      ),),
    );
  }
}