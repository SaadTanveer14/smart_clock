import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hijri/hijri_calendar.dart';

import '../utils/Colors.dart';

class LunerCalender extends StatefulWidget {
  const LunerCalender({super.key});

  @override
  State<LunerCalender> createState() => _LunerCalenderState();
}

class _LunerCalenderState extends State<LunerCalender> {
  var _today = HijriCalendar.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1.sh,
      decoration: CustomColor.boxDecoration,
      child: Row(
        children: [         
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text("LUNAR DATE: ${_today.hDay} ${_today.longMonthName}, ${_today.hYear}", style: GoogleFonts.bebasNeue(color: CustomColor.textGreenColor, fontSize: 10.sp, fontWeight: FontWeight.w500)),
          )
      ]),
    );
  }
}