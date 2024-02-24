import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
class CustomMatchesController extends GetxController{
  RxInt preferenceStatus = 0.obs;
  // RxString footballTeam = "Default".obs;
  // RxString footballPlayer = "Default".obs;
  Rx<TextEditingController> footballTeam = TextEditingController(text: "Default").obs;
  Rx<TextEditingController> footballPlayer = TextEditingController(text: "Default").obs;

  var storage = const FlutterSecureStorage();
  @override
  void onInit()
  {
    super.onInit();
    getCustomSearch();
    getMatchPreference();
  }
  Future<void> getCustomSearch() async {
    if(await storage.read(key: "custom_search") != null){
      preferenceStatus.value = int.parse((await storage.read(key: "custom_search"))!);
    }
    else{
      preferenceStatus.value = 0;
    }
  }

  Future<void> getMatchPreference() async {
    if(await storage.read(key: "custom_player") != null){
      footballPlayer.value.text = (await storage.read(key: "custom_player"))!;
    }
    else{
      footballPlayer.value.text = "Default";
    }

    if(await storage.read(key: "custom_team") != null){
      footballTeam.value.text = (await storage.read(key: "custom_team"))!;
    }
    else{
      footballTeam.value.text = "Default";
    }
  }

  Future<void> setCustomSearch(int value) async {
    storage.write(key: "custom_search", value: value.toString());
    preferenceStatus.value = value;
  }


  Future<void> setPlayer() async {
    storage.write(key: "custom_player", value: footballPlayer.value.text);
  }


  Future<void> setTeam() async {
    storage.write(key: "custom_team", value: footballTeam.value.text);
  }

  Future<String?> getTeam() async {
    return await storage.read(key: "custom_team");
  }

  Future<String?> getPlayer() async {
    return await storage.read(key: "custom_player");
  }
  
}