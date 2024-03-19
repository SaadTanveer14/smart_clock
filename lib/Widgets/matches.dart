import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:smart_clock/Controller/MatchesController.dart';
import 'package:smart_clock/Controller/PlayerMatchesController.dart';
import 'package:smart_clock/utils/Colors.dart';

class Matches extends StatefulWidget {
  final String screen;
  const Matches({super.key, required this.screen});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  MatchesController matchesController = Get.find<MatchesController>();
  PlayerMatchesController playerMatchesController = Get.find<PlayerMatchesController>();

  
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    matchesController.getMatches();
    playerMatchesController.getMatches();
    return  widget.screen == "tablet"?
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: (orientation==Orientation.portrait)? 0.7.sh : 0.54.sh,
        decoration: CustomColor.boxDecoration,
        child: Stack(
          children: [

            Column(
              children: [
                Text(
                  "MATCHES",
                    style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 30.sp,
                    height: 0
                  ),
                ), 
            
                  
                Obx(()=>
                  matchesController.matchtype.value == false?
                  Obx(() =>
                    matchesController.matchesModel!=null || matchesController.matchesModel.value.searchResult!.isNotEmpty?
                    Expanded(
                      child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: matchesController.matchesModel.value.searchResult?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) { 
                          DateTime datetime = DateFormat("EEEE, dd/MM/yyyy - hh:mm a Z").parse(matchesController.matchesModel.value.searchResult![index].upcomingMatch?.time ?? "Sunday, 00/00/0000 - 00:00 AM +0700");
                          String date = DateFormat("hh:mm a Z", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));
                          String time = DateFormat("EEEE, dd/MM/yyyy", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));

                          return  
                          matchesController.matchesModel.value.searchResult![index].upcomingMatch!=null?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (
                              Container(
                                decoration: BoxDecoration(
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                // width: 0.10.sw,
                                                child: Column(
                                                  children: [
                                                    Image.network(matchesController.matchesModel.value.searchResult![index].upcomingMatch!.homeImg!, height: 50, width: 50,),
                                                    Text(
                                                      matchesController.matchesModel.value.searchResult![index].upcomingMatch?.home! ?? matchesController.matchesModel.value.searchResult![index].upcomingMatch.runtimeType.toString(),
                                                        style: GoogleFonts.bebasNeue(
                                                        fontWeight: FontWeight.w500,
                                                        color: CustomColor.textPinkColor,
                                                        fontSize: 20.sp,
                                                        
                                                      ),
                                                        textAlign: TextAlign.center,
                                                                                  
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: CustomColor.lightgreyColor,
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.notifications, color: Colors.white,),
                                                )),
                                                Text(date, style: GoogleFonts.bebasNeue(fontSize:24.sp, color: CustomColor.textGoldenDarkColor),),
                                                Text(time, style: GoogleFonts.bebasNeue(fontSize:14.sp, color: CustomColor.textGoldenDarkColor),),                                              ],
                                            ),
                                            Expanded(
                                              child: Container(
                                                child: Column(
                                                  children: [
                                                    Image.network(matchesController.matchesModel.value.searchResult![index].upcomingMatch!.awayImg!, height: 50, width: 50,),
                                                    Text(
                                                    
                                                        matchesController.matchesModel.value.searchResult![index].upcomingMatch?.away! ?? "",
                                                        style: GoogleFonts.bebasNeue(
                                                        fontWeight: FontWeight.w500,
                                                        color: CustomColor.textPinkColor,
                                                        fontSize: 20.sp,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                              
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(matchesController.matchesModel.value.searchResult![index].upcomingMatch?.label! ?? "", style: GoogleFonts.bebasNeue(fontSize:9.sp, color: CustomColor.textGoldenLightColor),overflow: TextOverflow.fade,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ),
                          )
                          :
                          const SizedBox();
                        },    
                      ),
                    )
                    :
                    const SizedBox(),
                  )
                  :
                  Obx(() =>
                    playerMatchesController.playersModel!=null || playerMatchesController.playersModel.value.searchResult!.isNotEmpty?
                    Expanded(
                      child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: playerMatchesController.playersModel.value.searchResult?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) { 
                          DateTime datetime = DateFormat("EEEE, dd/MM/yyyy - hh:mm a Z").parse(playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.time ?? "Sunday, 00/00/0000 - 00:00 AM +0700");
                          String date = DateFormat("hh:mm a Z", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));
                          String time = DateFormat("EEEE, dd/MM/yyyy", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));

                          return  
                          playerMatchesController.playersModel.value.searchResult?[index].upcomingMatch!=null?
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: (
                              Container(
                                decoration: BoxDecoration(
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Image.network(playerMatchesController.playersModel.value.searchResult![index].upcomingMatch!.homeImg!, height: 50, width: 50,),
                                                  Text(
                                                    playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.home! ?? matchesController.matchesModel.value.searchResult![index].upcomingMatch.runtimeType.toString(),
                                                      style: GoogleFonts.bebasNeue(
                                                      fontWeight: FontWeight.w500,
                                                      color: CustomColor.textPinkColor,
                                                      fontSize: 20.sp,
                                                      
                                                    ),
                                                      textAlign: TextAlign.center,
                                                                                
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: CustomColor.lightgreyColor,
                                                    shape: BoxShape.circle
                                                  ),
                                                  child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.notifications, color: Colors.white,),
                                                )),
                                                
                                                Text(date, style: GoogleFonts.bebasNeue(fontSize:24.sp, color: CustomColor.textGoldenDarkColor),),
                                                Text(time, style: GoogleFonts.bebasNeue(fontSize:15.sp, color: CustomColor.textGoldenDarkColor),),                                                  ],
                                            ),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Image.network(playerMatchesController.playersModel.value.searchResult![index].upcomingMatch!.awayImg!, height: 50, width: 50,),
                                                  Text(
                                                      softWrap:true,
                                                      overflow: TextOverflow.ellipsis,
                                                      "${playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.away!} asfsdfa asdfasd adfasdf" ?? "",
                                                      style: GoogleFonts.bebasNeue(
                                                      fontWeight: FontWeight.w500,
                                                      color: CustomColor.textPinkColor,
                                                      fontSize: 20.sp,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                              
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.label! ?? "", style: GoogleFonts.bebasNeue(fontSize:15.sp, color: CustomColor.textGoldenLightColor),overflow: TextOverflow.fade,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ),
                          )
                          :
                          const SizedBox();
                        },
                      ),
                    )
                    :
                    const SizedBox(),
                  ),
                ),
              ],
            ),
            Obx(() =>
              matchesController.matchtype.value == false ?
                Positioned(top: 10, left: 10, child: GestureDetector(onTap:(){ matchesController.matchtype.value = true; } ,child: const Icon(Icons.group, color: CustomColor.textGoldenDarkColor,)))
              :
                Positioned(top: 10, left: 10, child: GestureDetector(onTap:(){ matchesController.matchtype.value = false; } ,child: const Icon(Icons.person, color: CustomColor.textGoldenDarkColor,))),
            )
          ],
        ),
      ),
    )
    :
    SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.backgroundColor,
        body: 
            Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "MATCHES",
                          style: GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 30.sp,
                          height: 0
                        ),
                      ),
                    ), 
                
                      
                    
                    Obx(()=>
                      matchesController.matchtype.value == false?
                      Obx(() =>
                        matchesController.matchesModel!=null || matchesController.matchesModel.value.searchResult!.isNotEmpty?
                        Expanded(
                          child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: matchesController.matchesModel.value.searchResult?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) { 
                              DateTime datetime = DateFormat("EEEE, dd/MM/yyyy - hh:mm a Z").parse(matchesController.matchesModel.value.searchResult![index].upcomingMatch?.time ?? "Sunday, 00/00/0000 - 00:00 AM +0700");
                              String date = DateFormat("hh:mm a Z", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));
                              String time = DateFormat("EEEE, dd/MM/yyyy", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));

                              return  
                              matchesController.matchesModel.value.searchResult![index].upcomingMatch!=null?
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (
                                  Container(
                                    decoration: BoxDecoration(
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: 0.28.sw,
                                                  child: Column(
                                                    children: [
                                                      Image.network(matchesController.matchesModel.value.searchResult![index].upcomingMatch!.homeImg!, height: 50, width: 50,),
                                                      Text(
                                                        matchesController.matchesModel.value.searchResult![index].upcomingMatch?.home! ?? matchesController.matchesModel.value.searchResult![index].upcomingMatch.runtimeType.toString(),
                                                          style: GoogleFonts.bebasNeue(
                                                          fontWeight: FontWeight.w500,
                                                          color: CustomColor.textPinkColor,
                                                          fontSize: 20.sp,
                                                        ),
                                                          textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: CustomColor.lightgreyColor,
                                                        shape: BoxShape.circle
                                                      ),
                                                      child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.notifications, color: Colors.white,),
                                                    )),
                                                    Text(date, style: GoogleFonts.bebasNeue(fontSize:24.sp, color: CustomColor.textGoldenDarkColor),),
                                                    Text(time, style: GoogleFonts.bebasNeue(fontSize:14.sp, color: CustomColor.textGoldenDarkColor),),
                                                  ],
                                                ),
                                                Container(
                                                  width: 0.28.sw,
                                                  child: Column(
                                                    children: [
                                                      Image.network(matchesController.matchesModel.value.searchResult![index].upcomingMatch!.awayImg!, height: 50, width: 50,),
                                                      Text(
                                                          matchesController.matchesModel.value.searchResult![index].upcomingMatch?.away! ?? "",
                                                          style: GoogleFonts.bebasNeue(
                                                          fontWeight: FontWeight.w500,
                                                          color: CustomColor.textPinkColor,
                                                          fontSize: 20.sp,
                                                        ),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(matchesController.matchesModel.value.searchResult![index].upcomingMatch?.label! ?? "", style: GoogleFonts.bebasNeue(fontSize:18.sp, color: CustomColor.textGoldenLightColor),overflow: TextOverflow.fade,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ),
                              )
                              :
                              const SizedBox();
                           
                           
                          },
                                  
                                      ),
                        )
                        :
                        const SizedBox(),
                      )
                      :
                      Obx(() =>
                        playerMatchesController.playersModel!=null || playerMatchesController.playersModel.value.searchResult!.isNotEmpty?
                        Expanded(
                          child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: playerMatchesController.playersModel.value.searchResult?.length ?? 0,
                          itemBuilder: (BuildContext context, int index) { 
                              DateTime datetime = DateFormat("EEEE, dd/MM/yyyy - hh:mm a Z").parse(playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.time ?? "Sunday, 00/00/0000 - 00:00 AM +0700");
                              String date = DateFormat("hh:mm a Z", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));
                              String time = DateFormat("EEEE, dd/MM/yyyy", 'en_US').format(datetime).replaceAllMapped(RegExp(r'(\d+:\d+)'), (Match m) => m[1]!.padLeft(5, '0'));

                              return  
                              playerMatchesController.playersModel.value.searchResult![index].upcomingMatch!=null?
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: (
                                  Container(
                                    decoration: BoxDecoration(
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  width: 0.28.sw,
                                                  child: Text(
                                                    playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.home! ?? matchesController.matchesModel.value.searchResult![index].upcomingMatch.runtimeType.toString(),
                                                      style: GoogleFonts.bebasNeue(
                                                      fontWeight: FontWeight.w500,
                                                      color: CustomColor.textPinkColor,
                                                      fontSize: 20.sp,
                                                    ),
                                                      textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: CustomColor.lightgreyColor,
                                                        shape: BoxShape.circle
                                                      ),
                                                      child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Icon(Icons.notifications, color: Colors.white,),
                                                    )),
                                                  Text(date, style: GoogleFonts.bebasNeue(fontSize:24.sp, color: CustomColor.textGoldenDarkColor),),
                                                  Text(time, style: GoogleFonts.bebasNeue(fontSize:14.sp, color: CustomColor.textGoldenDarkColor),),                                                      ],
                                                ),
                                                Container(
                                                  width: 0.28.sw,
                                                  child: Text(
                                                      playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.away! ?? "",
                                                      style: GoogleFonts.bebasNeue(
                                                      fontWeight: FontWeight.w500,
                                                      color: CustomColor.textPinkColor,
                                                      fontSize: 20.sp,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(playerMatchesController.playersModel.value.searchResult![index].upcomingMatch?.label! ?? "", style: GoogleFonts.bebasNeue(fontSize:18.sp, color: CustomColor.textGoldenLightColor),overflow: TextOverflow.fade,),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ),
                              )
                              :
                              const SizedBox();
                           
                           
                          },
                                  
                                      ),
                        )
                        :
                        const SizedBox(),
                      )
                    ),
                  ],
                ),
                Obx(() =>
                  matchesController.matchtype.value == false ?
                    Positioned(top: 10, left: 10, child: GestureDetector(onTap:(){ matchesController.matchtype.value = true; } ,child: const Icon(Icons.group, color: CustomColor.textGoldenDarkColor,)))
                  :
                    Positioned(top: 10, left: 10, child: GestureDetector(onTap:(){ matchesController.matchtype.value = false; } ,child: const Icon(Icons.person, color: CustomColor.textGoldenDarkColor,))),
                )
              ],

            ),
      
      )
    );
  }
}