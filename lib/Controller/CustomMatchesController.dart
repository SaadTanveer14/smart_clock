import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
class CustomMatchesController extends GetxController{
  RxInt preferenceStatus = 0.obs;
  RxList<dynamic> listOfTeamsObs = [].obs;
  RxList<dynamic> listOfPlayersObs = [].obs;

  RxString csvTeams = "Default".obs;
  RxString csvPlayers = "Default".obs;

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
    getMatchPreferenceNew();
    getTeamNew();
    getPlayersNew();
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

  Future<void> getMatchPreferenceNew() async {
    getTeamNew();
    getPlayersNew();
    footballPlayer.value.text = "Default";
    footballTeam.value.text = "Default";
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


  Future<void> setTeamNew() async {
    String? stringOfTeams = await storage.read(key: 'custom_teams');
    if(stringOfTeams!=null && footballTeam.value.text !="Default" && footballTeam.value.text !="")
    {
      listOfTeamsObs.value = jsonDecode(stringOfTeams);
      if(!listOfTeamsObs.contains(footballTeam.value.text))
      {
        listOfTeamsObs.add(footballTeam.value.text);
        await storage.write(key: 'custom_teams', value: jsonEncode(listOfTeamsObs));
      }
      else{
        print("It contains duplicate");
      }
      return;
    }

    if(footballTeam.value.text !="Default" && footballTeam.value.text !="")
    {
      listOfTeamsObs.value = [footballTeam.value.text];
      await storage.write(key: 'custom_teams', value: jsonEncode(listOfTeamsObs));
    }
  }


  Future<String> getTeamNew() async {
    String? stringOfTeams = await storage.read(key: 'custom_teams');
    if(stringOfTeams!=null)
    {
      
      listOfTeamsObs.value = jsonDecode(stringOfTeams);
      csvTeams.value  = listOfTeamsObs.join(',');

    }
    return csvTeams.value;
  }

  Future<void> deleteTeam(int index) async {
    listOfTeamsObs.removeAt(index);
    await storage.write(key: 'custom_teams', value: jsonEncode(listOfTeamsObs));
    footballPlayer.value.text = "Default";
    footballTeam.value.text = "Default";
  }

  Future<void> setPlayerNew() async {
    String? stringOfPlayers = await storage.read(key: 'custom_players');
    if(stringOfPlayers!=null && footballPlayer.value.text !="Default" && footballPlayer.value.text !="")
    {
      listOfPlayersObs.value = jsonDecode(stringOfPlayers);
      if(!listOfPlayersObs.contains(footballPlayer.value.text))
      {
        listOfPlayersObs.add(footballPlayer.value.text);
        await storage.write(key: 'custom_players', value: jsonEncode(listOfPlayersObs));
      }
      else{
        print("It contains duplicate");
      }
      return;
    }

    if(footballPlayer.value.text !="Default" && footballPlayer.value.text !="")
    {
      listOfPlayersObs.value = [footballPlayer.value.text];
    }
    await storage.write(key: 'custom_players', value: jsonEncode(listOfPlayersObs));
  }

  Future<String> getPlayersNew() async {
    String? stringOfPlayers = await storage.read(key: 'custom_players');
    if(stringOfPlayers!=null)
    {
      listOfPlayersObs.value = jsonDecode(stringOfPlayers);
      csvPlayers.value  = listOfPlayersObs.join(',');
    }
    return csvPlayers.value;
  }

  Future<void> deletePlayer(int index) async {
    listOfPlayersObs.removeAt(index);
    await storage.write(key: 'custom_players', value: jsonEncode(listOfPlayersObs));
    footballPlayer.value.text = "Default";
    footballTeam.value.text = "Default";
  }
  

  Future<String?> getTeam() async {
    return await storage.read(key: "custom_team");
  }

  Future<String?> getPlayer() async {
    return await storage.read(key: "custom_player");
  }
  
}