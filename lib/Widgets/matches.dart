import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_clock/Controller/MatchesController.dart';
import 'package:smart_clock/utils/Colors.dart';

class Matches extends StatefulWidget {
  const Matches({super.key});

  @override
  State<Matches> createState() => _MatchesState();
}

class _MatchesState extends State<Matches> {
  MatchesController matchesController = Get.put(MatchesController());

  @override
  Widget build(BuildContext context) {
    matchesController.getMatches();
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.backgroundColor,
        body: 
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

                  
                
                Obx(() =>
                  matchesController.matchesModel!=null || matchesController.matchesModel.value.searchResult!.isNotEmpty?
                  Expanded(
                    child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: matchesController.matchesModel.value.searchResult?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) { 
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
                                            child: Text(
                                              matchesController.matchesModel.value.searchResult![index].upcomingMatch?.home! ?? matchesController.matchesModel.value.searchResult![index].upcomingMatch.runtimeType.toString(),
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
                                              Text("17:00", style: GoogleFonts.bebasNeue(fontSize:24.sp, color: CustomColor.textGoldenDarkColor),),
                                              Text(matchesController.matchesModel.value.searchResult![index].upcomingMatch?.label! ?? "", style: GoogleFonts.bebasNeue(fontSize:18.sp, color: CustomColor.textGoldenLightColor),),
                                            ],
                                          ),
                                          Container(
                                            width: 0.28.sw,
                                            child: Text(
                                            
                                                matchesController.matchesModel.value.searchResult![index].upcomingMatch?.away! ?? "",
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
              ],
            ),
      
      )
    );
  }
}