import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:smart_clock/Models/Matches_Model.dart';

class MatchesController extends GetxController{
    var matchesModel = MatchesModel().obs;

    @override
    void onInit()
    {
      super.onInit();
      getMatches();
    }
    Future<void> getMatches() async{
      String url = "http://149.28.150.230:9991/nextMatch/clubs/arsenal";

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