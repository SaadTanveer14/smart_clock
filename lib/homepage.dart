import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_clock/Widgets/calender.dart';
import 'package:smart_clock/Widgets/clock.dart';
import 'package:smart_clock/Widgets/lunerCalender.dart';
import 'package:smart_clock/Widgets/matches.dart';
import 'package:smart_clock/Widgets/profile.dart';
import 'package:smart_clock/Widgets/sportsNews.dart';
import 'package:smart_clock/Widgets/weather.dart';
import 'package:smart_clock/utils/Colors.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:smart_clock/Controller/SportsNewController.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: 
        ScreenUtil().screenWidth > 600?
        Stack(
          children: [
            Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Clock(screen: "tablet"),
                    )),
                    // Container(color: Colors.white, child: CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.utc(2010, 10, 16), lastDate: DateTime.utc(2030, 3, 14) , onDateChanged: (DateTime value) {  },))
                    Expanded(
                      child: Column(
                        children: [
                          const LunerCalender(screen: "mobile"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Calender(screen:"tablet"),
                          ),
                        ],
                      ),
                    )
                    // Clock(),
                  ],
                ),
               
                  
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Weather(screen:"tablet")),
                    Expanded(child: Matches(screen: "tablet",)),
                    Expanded(child: SportNews(screen: "tablet")),
            
                  ],
                ),
            
            
              ],
            ),
            Positioned(right: 20, top:10, child: GestureDetector(onTap: () => Get.to(()=>const Profile(screen: "tablet",)), child: Icon(Icons.settings, color: Colors.white,size: 20.sp,)))
          ],
        )
        :
        Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "HOME",
                          style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 30.sp,
                          height: 0
                        ),
                      ),
                    ), 
                  Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Clock(screen: "mobile"),
                      )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Weather(screen:"mobile"),
                      )),
                    ],
                  ),

                  
                  Row(
                    children: [
                      Expanded(child: Column(
                        children: [
                          const LunerCalender(screen: "mobile"),
                          Calender(screen:"mobile"),
                        ],
                      )),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(right: 20, top:10, child: GestureDetector(onTap: () => Get.to(()=>const Profile(screen: "mobile",)), child: Icon(Icons.settings, color: Colors.white,size: 20.sp,)))
          ],
        )
      ),
    );
  }
}