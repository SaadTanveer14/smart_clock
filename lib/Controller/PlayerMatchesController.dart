import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:smart_clock/Controller/CustomMatchesController.dart';
import 'package:smart_clock/Models/Matches_Model.dart';
import 'package:smart_clock/Models/Player_Model.dart';

class PlayerMatchesController extends GetxController{
    var playersModel = PlayersModel().obs;
    CustomMatchesController customMatchesController = Get.find<CustomMatchesController>();

    @override
    void onInit()
    {
      super.onInit();
      getMatches();
    }
    Future<void> getMatches() async{
      int status = customMatchesController.preferenceStatus.value;
      String? player = await customMatchesController.getPlayer();
      String url = "http://149.28.150.230:9991/nextMatch/players/Cristiano";

      if(status == 1)
      {
        url = "http://149.28.150.230:9991/nextMatch/players/$player";
      }
      else
      {
        url = "http://149.28.150.230:9991/nextMatch/players/Cristiano";
      }

      try
      {
        var response = await get(Uri.parse(url)).timeout(Duration(seconds: 20));
        if(response.statusCode == 200)
        {
          final responseBody = response.body;
          var js =jsonDecode(responseBody);
          playersModel.value = PlayersModel.fromJson(js);
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