import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_clock/Controller/CustomMatchesController.dart';
import 'package:smart_clock/utils/Colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Profile extends StatefulWidget {
  final String screen;

  const Profile({super.key, required this.screen});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CustomMatchesController customMatchesController = Get.find<CustomMatchesController>();
  bool _isEditingText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    
    return
     
    Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:8.0, horizontal:30),
          child: 
          widget.screen == "tablet"?
          Column(
            children: [
              Text(
              "Preferences",
                style:GoogleFonts.bebasNeue(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: (orientation==Orientation.portrait)? 18.sp :12.sp,
                ),
              ),
          
              Row(
                children: [
                  Text(
                    "Enable/Disable custom search for Matches",
                      style:GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: (orientation==Orientation.portrait)? 15.sp : 10.sp,
                      ),
                  ),
                  const Spacer(),
                  Obx(()=>
                    ToggleSwitch(
                      minWidth: 0.12.sw,
                      minHeight: 0.05.sw,
                      cornerRadius: 50.0,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: customMatchesController.preferenceStatus.value,
                      totalSwitches: 2,
                      labels: const ["DISABLE", "ENABLE"],
                      customTextStyles: [
                        GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                      ],
                      onToggle: (index) async{
                        await customMatchesController.setCustomSearch(index!);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.1.sh,),
            Obx(() =>
            customMatchesController.preferenceStatus.value == 1? 
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Favourite FootBall Player",
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: (orientation==Orientation.portrait)? 16.sp:10.sp,
                            ),
                          ),
                        
                      ],
                    ),
                    const Spacer(),
                    Container( width: 0.2.sw, child: _editPlayerTextField()),                      
                
                  ],
                ),
              )
              :
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30),
                child: Row(
                  children: [
                    Text(
                      "Add Favourite FootBall Player",
                        style:GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.lightgreyColor,
                          fontSize: (orientation==Orientation.portrait)? 16.sp : 10.sp,
                        ),
                      ),
                  ],
                ),
              ),
            ),


            Obx(() => 
                customMatchesController.preferenceStatus.value == 1? 

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(
                          "Add Your Favourite Football Team",
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: (orientation==Orientation.portrait)? 16.sp : 10.sp,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Obx(()=> Container( width: 0.2.sw, child: _editTeamTextField())),                      

                  ],
                )
                :
                Row(
                  children: [
                    Text(
                      "Add your Favourite FootBall Team",
                        style:GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.lightgreyColor,
                          fontSize: (orientation==Orientation.portrait)? 16.sp : 10.sp,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          )
          :
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Preferences",
                    style: GoogleFonts.bebasNeue(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 30.sp,
                    height: 0
                  ),
                ),
              ), 
          
              Row(
                children: [
                  Text(
                    "Enable/Disable custom search for Matches",
                      style:GoogleFonts.bebasNeue(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize:  14.sp
                      ),
                  ),
                  const Spacer(),
                  Obx(()=>
                    ToggleSwitch(
                      minWidth: 0.12.sw,
                      minHeight: 0.05.sw,
                      cornerRadius: 50.0,
                      inactiveFgColor: Colors.white,
                      initialLabelIndex: customMatchesController.preferenceStatus.value,
                      totalSwitches: 2,
                      labels: const ["DISABLE", "ENABLE"],
                      customTextStyles: [
                        GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                        GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                      ],
                      onToggle: (index) async{
                        await customMatchesController.setCustomSearch(index!);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 0.1.sh,),
            Obx(() =>
            customMatchesController.preferenceStatus.value == 1? 
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Add Favourite FootBall Player",
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        
                      ],
                    ),
                    const Spacer(),
                    Container( width: 0.2.sw, child: _editPlayerTextField()),                      
                
                  ],
                ),
              )
              :
              Padding(
                padding: const EdgeInsets.symmetric(vertical:30),
                child: Row(
                  children: [
                    Text(
                      "Add Favourite FootBall Player",
                        style:GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.lightgreyColor,
                          fontSize: 16.sp,
                        ),
                      ),
                  ],
                ),
              ),
            ),


            Obx(() => 
                customMatchesController.preferenceStatus.value == 1? 

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text(
                          "Add Your Favourite Football Team",
                            style:GoogleFonts.bebasNeue(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16.sp,
                            ),
                          ),
                      ],
                    ),
                    const Spacer(),
                    Obx(()=> Container( width: 0.2.sw, child: _editTeamTextField())),                      

                  ],
                )
                :
                Row(
                  children: [
                    Text(
                      "Add your Favourite FootBall Team",
                        style:GoogleFonts.bebasNeue(
                          fontWeight: FontWeight.w500,
                          color: CustomColor.lightgreyColor,
                          fontSize: 16.sp,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _editPlayerTextField() {
    if (_isEditingText)
      return 
        TextField(
          style: TextStyle(color: Colors.white),
          onSubmitted: (newValue) async{
            await customMatchesController.setPlayer();
            setState(() {
              // customMatchesController.footballPlayer.value.text = newValue;
              _isEditingText =false;
            });
          },
          autofocus: true,
          controller: customMatchesController.footballPlayer.value,
      
      );
    return 
      InkWell(
        onTap: (){
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          customMatchesController.footballPlayer.value.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        )
      
    );
  }


  Widget _editTeamTextField() {
    if (_isEditingText)
      return 
        TextField(
          style: TextStyle(color: Colors.white),
          onSubmitted: (newValue) async{
            await customMatchesController.setTeam();
            setState(() {
              // customMatchesController.footballPlayer.value.text = newValue;
              _isEditingText =false;
            });
          },
          autofocus: true,
          controller: customMatchesController.footballTeam.value,
      
      );
    return 
      InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          customMatchesController.footballTeam.value.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        )
      
    );
  }
}