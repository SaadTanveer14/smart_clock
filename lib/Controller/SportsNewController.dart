import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:smart_clock/Models/Sportsnew_Model.dart';
import 'package:smart_clock/utils/internetConnectivity.dart';

class SportsNewsController extends GetxController{
  var sportsNewsModel = SportsNewsModel().obs;
  RxList<Articles> filteredNews =  <Articles>[].obs;
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit()
  {
    super.onInit();
    getSportsNews();
  }

  void search(String query) {
    filteredNews.value = sportsNewsModel.value.articles!
        .where((item) => item.title!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
  Future<void> getSportsNews() async{
    String url = "https://newsapi.org/v2/top-headlines?country=sg&category=sports&apiKey=47f36ad2067d412eacd68507c7529c9c";
    final ConnectivityResult result = await _connectivity.checkConnectivity();
    if (result == ConnectivityResult.none) {
      showNoInternetSnackbar();
    }
    try
    {
      var response = await get(Uri.parse(url)).timeout(Duration(seconds: 20));
      if(response.statusCode == 200)
      {
        final responseBody = response.body;
        var js =jsonDecode(responseBody);
        sportsNewsModel.value = SportsNewsModel.fromJson(js);
        filteredNews.value = sportsNewsModel.value.articles!;
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


