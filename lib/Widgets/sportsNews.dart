import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_clock/Controller/SportsNewController.dart';
import 'package:smart_clock/utils/Colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SportNews extends StatefulWidget {
  final String screen;
  const SportNews({super.key, required this.screen});

  @override
  State<SportNews> createState() => _SportNewsState();
}

class _SportNewsState extends State<SportNews> {
  SportsNewsController sportsNewsController = Get.put(SportsNewsController());

  @override
  Widget build(BuildContext context) {
    return widget.screen == "tablet"?
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromARGB(255, 150, 134, 133),
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
        height: 0.48.sh,
        child: Obx(()=>
            Column(
              children: [
                Text(
                  "FOOTBALL NEWS",
                    style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 15.sp,
                    height: 0
                  ),
                ), 
                Expanded(
                  child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sportsNewsController.sportsNewsModel.value.articles?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) { 
                    return
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async{await _launchUrl(sportsNewsController.sportsNewsModel.value.articles![index].url!);},
                        child: (
                          Container(
                            decoration: BoxDecoration(
                              // color: Color.fromARGB(255, 150, 134, 133),
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                        sportsNewsController.sportsNewsModel.value.articles![index].title.toString(),
                                        style: GoogleFonts.bebasNeue(
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textPinkColor,
                                          fontSize: 8.sp,
                                          height: 0
                                        ),
                                      ),
                                          
                                      Text("Readmore >", style: GoogleFonts.bebasNeue(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 8.sp,),)
                                  ],
                                ),
                        
                              ),
                            ),
                          )
                        ),
                      ),
                    );
                  },
                          
                          ),
                ),
              ],
            ),
        ),
      ),
    )
    :
    SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.backgroundColor,
        body: Obx(()=>
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "FOOTBALL NEWS",
                      style: GoogleFonts.bebasNeue(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 30.sp,
                      height: 0
                    ),
                  ),
                ), 

                Obx(() => sportsNewsController.sportsNewsModel.value!=null || sportsNewsController.sportsNewsModel.value.articles!.isNotEmpty ?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (query) => sportsNewsController.search(query),
                      style: GoogleFonts.poppins(color: Colors.white),
                      decoration: InputDecoration(
                        
                        hintText: 'Type something',
                        hintStyle: GoogleFonts.poppins(color: Colors.grey),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gapPadding : 0,
                          borderSide: BorderSide(
                            color: CustomColor.primaryColor, // Set your border color
                          ),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          gapPadding : 0,
                  
                          
                        ),
                      ),
                    ),
                  ):
                  const SizedBox(),
                ),
                Expanded(
                  child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sportsNewsController.filteredNews.length,
                  itemBuilder: (BuildContext context, int index) { 
                    return
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async{await _launchUrl(sportsNewsController.filteredNews[index].url!);},
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
                                    Text(
                                        sportsNewsController.filteredNews[index].title.toString(),
                                        style: GoogleFonts.bebasNeue(
                                          fontWeight: FontWeight.w500,
                                          color: CustomColor.textPinkColor,
                                          fontSize: 15.sp,
                                          height: 0
                                        ),
                                      ),
                                    Text("Readmore >", style: GoogleFonts.bebasNeue(fontWeight: FontWeight.w500, color: Colors.white, fontSize: 15.sp,),)
                                  ],
                                ),
                              ),
                            ),
                          )
                        ),
                      ),
                    );
                  },
                          
                          ),
                ),
              ],
            ),
        ),
      ),
    )
    ;
  }
  Future<void> _launchUrl(String link) async {
    final Uri _url = Uri.parse(link);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}