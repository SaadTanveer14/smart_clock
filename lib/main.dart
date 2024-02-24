import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smart_clock/Controller/CustomMatchesController.dart';
import 'package:smart_clock/View/SplashScreen.dart';
import 'package:smart_clock/homepage.dart';
import 'package:smart_clock/utils/Colors.dart';

void main() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: CustomColor.darkgreyColor, // Set your desired color
      ),
    );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CustomMatchesController());
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: Builder(
        builder: (context) {
          return GetMaterialApp(
            theme:ThemeData(
            scaffoldBackgroundColor: CustomColor.darkgreyColor,
            primaryColor: CustomColor.primaryColor, 
            indicatorColor: CustomColor.primaryColor,
            hintColor: CustomColor.primaryColor
          ),
            home: const SplashScreen(),
          );
        }
      ),
    );
  }
}

