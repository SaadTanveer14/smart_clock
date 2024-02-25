  import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showNoInternetSnackbar() {
    Get.snackbar(
      backgroundColor:Colors.white,
      'No internet connection',
      'Please check your internet connection',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      animationDuration: Duration(milliseconds: 500),
    );
  }