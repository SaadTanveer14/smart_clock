import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';

import '../utils/Colors.dart';

class LunerCalender extends StatefulWidget {
  final String screen;
  const LunerCalender({super.key, required this.screen});

  @override
  State<LunerCalender> createState() => _LunerCalenderState();
}

class _LunerCalenderState extends State<LunerCalender> {
  var _today = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Padding(
      padding: const EdgeInsets.only(right:8, left: 8,top: 8.0),
      child: 
      widget.screen == "tablet"?
      Container(
        height: (orientation == Orientation.portrait)? 0.04.sh-8: 0.08.sh-8, 
        decoration: CustomColor.boxDecoration,
        child: Row(
          children: [         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("LUNAR DATE: ${_today.hDay} ${_today.longMonthName}, ${_today.hYear}", style: GoogleFonts.bebasNeue(color: CustomColor.textGreenColor, fontSize: 10.sp, fontWeight: FontWeight.w500)),
            )
        ]),
      )
      :
      Container(
        decoration: CustomColor.boxDecoration,
        child: Row(
          children: [         
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("LUNAR DATE: ${_today.hDay} ${_today.longMonthName}, ${_today.hYear}", style: GoogleFonts.bebasNeue(color: CustomColor.textGreenColor, fontSize: 18.sp, fontWeight: FontWeight.w500)),
            )
        ]),
      )
    );
  }
}