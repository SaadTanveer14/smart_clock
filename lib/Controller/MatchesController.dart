import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:smart_clock/Controller/CustomMatchesController.dart';
import 'package:smart_clock/Models/Matches_Model.dart';
import 'package:smart_clock/utils/internetConnectivity.dart';

class MatchesController extends GetxController{
    var matchesModel = MatchesModel().obs;
    CustomMatchesController customMatchesController = Get.find<CustomMatchesController>();
    RxBool matchtype = false.obs;
    final Connectivity _connectivity = Connectivity();


    @override
    void onInit()
    {
      super.onInit();
      getMatches();
    }
    Future<void> getMatches() async{
      final ConnectivityResult result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        showNoInternetSnackbar();
      }
      int status = customMatchesController.preferenceStatus.value;
      String? team = await customMatchesController.getTeamNew();
      String url = "http://149.28.150.230:9991/nextMatchNew/clubs/arsenal";

      if(status == 1 && team!=null && team!="")
      {
        url = "http://149.28.150.230:9991/nextMatchNew/clubs/$team";
      }
      else
      {
        url = "http://149.28.150.230:9991/nextMatchNew/clubs/arsenal";
      }

      try
      {
        var response = await get(Uri.parse(url)).timeout(Duration(seconds: 20));
        if(response.statusCode == 200)
        {
          final responseBody = response.body;
          var js =jsonDecode(responseBody);
          matchesModel.value = MatchesModel.fromJson(js);
          if (kDebugMode) {
            print(js);
          }
        }
      }
      on SocketException catch (_) {
        if (kDebugMode) {
          print('Not connected!');
        }
      }
      on TimeoutException catch (_) {
        if (kDebugMode) {
          print('TimeOut Exception');
        }
      }
      catch(e)
      {
        if (kDebugMode) {
          print(e);
        }
      }
  }
}