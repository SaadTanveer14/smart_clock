import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_clock/Widgets/lunerCalender.dart';
import 'package:smart_clock/utils/Colors.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  final String screen;
  const Calender({super.key, required this.screen});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];

  @override
  Widget build(BuildContext context) {
    final configt = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: Colors.indigo,
      
      dayTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontWeight: FontWeight.bold,
        fontSize: 6.sp
      ),
      weekdayLabelTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontSize: 9.sp,
        fontWeight: FontWeight.bold
      ),
      controlsTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontSize: 8.sp,
        fontWeight: FontWeight.bold
      ),
      selectedDayTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontSize: 8.sp,
        fontWeight: FontWeight.bold
      ),
    );

    final configm = CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      selectedDayHighlightColor: Colors.indigo,
      
      dayTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontWeight: FontWeight.bold,
        fontSize: 15.sp
      ),
      weekdayLabelTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold
      ),
      controlsTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontSize: 15.sp,
        fontWeight: FontWeight.bold
      ),
      selectedDayTextStyle: TextStyle(
        color: CustomColor.textGreenColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold
      ),
    );

    return  widget.screen == "tablet"?
    
    Container(
      height: 0.35.sh,
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 150, 134, 133),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(
          width: 2,
          color: CustomColor.lightgreyColor
        ),
        gradient: const LinearGradient(
          colors: [CustomColor.darkgreyColor, CustomColor.lightgreyColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CalendarDatePicker2(
          config: configt, 
          value: _singleDatePickerValueWithDefaultValue,
        // initialDate: DateTime.now(), 
        // firstDate: DateTime.utc(2010, 10, 16), 
        // lastDate: DateTime.utc(2030, 3, 14), 
        // onDateChanged: (DateTime value) {  },
        )
      )
      :
      Container(
      height: 0.35.sh,
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 150, 134, 133),
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        border: Border.all(
          width: 2,
          color: CustomColor.lightgreyColor
        ),
        gradient: const LinearGradient(
          colors: [CustomColor.darkgreyColor, CustomColor.lightgreyColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: CalendarDatePicker2(
          config: configm, 
          value: _singleDatePickerValueWithDefaultValue,
        // initialDate: DateTime.now(), 
        // firstDate: DateTime.utc(2010, 10, 16), 
        // lastDate: DateTime.utc(2030, 3, 14), 
        // onDateChanged: (DateTime value) {  },
        )
      );
  }
}