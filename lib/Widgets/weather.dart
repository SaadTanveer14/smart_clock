import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smart_clock/Controller/WeatherController.dart';
import 'package:smart_clock/utils/Colors.dart';

class Weather extends StatefulWidget {
  final String screen;
  const Weather({super.key, required this.screen});

  @override
  State<Weather> createState() => _WeatherState();
}



class _WeatherState extends State<Weather> {
  WeatherController weatherController = Get.put(WeatherController());
  late String hours;
  late String minutes;
  late String seconds;
  late String dayTime;
  late String currentDay;


  @override
  void initState(){
    super.initState();
    updateTime();
    Timer.periodic(Duration(seconds: 60), (Timer timer) {
      if(mounted)
        {
          setState(() {
            updateTime();
          });
        }
    });
  }

  void updateTime() {
    DateTime now = DateTime.now();
    hours = DateFormat('hh').format(now);
    minutes = DateFormat('mm').format(now);
    seconds = DateFormat('ss').format(now);
    dayTime = DateFormat('a').format(now);
    currentDay = DateFormat('EEEE').format(now);

  }



  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return widget.screen == "tablet"?
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: (orientation==Orientation.portrait)? 0.7.sh : 0.54.sh,
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
        // width: 0.3.sw,
        child: Padding(
          padding: EdgeInsets.only(bottom:20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // const Spacer(),
                  Obx(()=>Image.asset(weatherController.conditionImage.value, height: 0.1.sh, width:  0.1.sh,)),
                  Obx(()=>
                    Text(
                        weatherController.weatherModel.value.main==null? "": weatherController.weatherModel.value.weather![0].main!,
                        style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 8.sp,
                        height: 0
                      ),
                    ), 
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Obx(()=>
                    Text(
                        weatherController.weatherModel.value.main==null? "00°": weatherController.weatherModel.value.main!.temp!.toInt().toString()+"°",
                        style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 40.sp,
                        height: 0
                      ),
                    ), 
                  ),
      
      
      
                   
      
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height:30),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          
                          Text(
                            hours,
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: CustomColor.textBlueColor,
                              fontSize: 15.sp,
                              height: 0.8
                                  
                            ),
                          ),
                          Text(
                            ':',
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: CustomColor.textBlueColor,
                              fontSize: 15.sp,
                              height: 0.8
                            ),
                          ),
                          Text(
                            minutes,
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: CustomColor.textBlueColor,
                              fontSize: 15.sp,
                              height: 0.8
                            ),
                          ),
                        ],
                      ),
                      Text(
                        currentDay,
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textBlueColor,
                          fontSize: 10.sp,
                          height: 0
      
                        ),
                      ),
                    ],
                  ),
      
                ],
              ),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/weather/humidity.png",height: 0.05.sh,width: 0.05.sh,),
                      SizedBox(height: 0.01.sh,),
                      Text(
                        "${weatherController.weatherModel.value.main?.humidity ?? 00}%",
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textBlueColor,
                          fontSize: 15.sp,
                          height: 1
                        ),
                      ),
                      Text(
                        "HUMIDITY",
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textBlueColor,
                          fontSize: 8.sp,
                          height: 1.1
                        ),
                      )
                    ],
                  ),
                  
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/weather/airQuality.png",height: 0.05.sh,width: 0.05.sh,),
                      SizedBox(height: 0.01.sh,),
                      Text(
                        "24%",
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textBlueColor,
                          fontSize: 15.sp,
                          height: 1
                        ),
                      ),
                      Text(
                        "AIR POLUTION",
                        style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.textBlueColor,
                          fontSize: 8.sp,
                          height: 1.1
                        ),
                      )
                    ],
                  ),
          
                ],
              )
            ]
          ),
        ),
      ),
    )
    :
    Container(
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
      // width: 0.3.sw,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical:10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // const Spacer(),
                Obx(()=>Image.asset(weatherController.conditionImage.value, height: 0.1.sh, width:  0.1.sh,)),
                Obx(()=>
                  Text(
                      weatherController.weatherModel.value.main==null? "": weatherController.weatherModel.value.weather![0].main!,
                      style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w500,
                      color: CustomColor.textBlueColor,
                      fontSize: 20.sp,
                      height: 0
                    ),
                  ), 
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(()=>
                  Text(
                      weatherController.weatherModel.value.main==null? "00°": weatherController.weatherModel.value.main!.temp!.toInt().toString()+"°",
                      style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w500,
                      color: CustomColor.textBlueColor,
                      fontSize: 90.sp,
                      height: 0
                    ),
                  ), 
                ),
        
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height:30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text(
                          hours,
                          style:GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.w500,
                            color: CustomColor.textBlueColor,
                            fontSize: 30.sp,
                            height: 0.8
                                
                          ),
                        ),
                        Text(
                          ':',
                          style:GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(172, 226, 250, 1),
                            fontSize: 30.sp,
                            height: 0.8
                          ),
                        ),
                        Text(
                          minutes,
                          style:GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.w500,
                            color: CustomColor.textBlueColor,
                            fontSize: 30.sp,
                            height: 0.8
                          ),
                        ),
                      ],
                    ),
                    Text(
                      currentDay,
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 20.sp,
                        height: 0
    
                      ),
                    ),
                  ],
                ),
    
              ],
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/weather/humidity.png",height: 0.05.sh,width: 0.05.sh,),
                    SizedBox(height: 0.01.sh,),
                    Text(
                      "${weatherController.weatherModel.value.main?.humidity ?? 00}%",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 25.sp,
                        height: 1
                      ),
                    ),
                    Text(
                      "HUMIDITY",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 10.sp,
                        height: 1.1
                      ),
                    )
                  ],
                ),
                
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/weather/airQuality.png",height: 0.05.sh,width: 0.05.sh,),
                    SizedBox(height: 0.01.sh,),
                    Text(
                      "24%",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 25.sp,
                        height: 1
                      ),
                    ),
                    Text(
                      "AIR POLUTION",
                      style: GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textBlueColor,
                        fontSize: 10.sp,
                        height: 1.1
                      ),
                    )
                  ],
                ),
        
              ],
            )
          ]
        ),
      ),
    );
  }
}