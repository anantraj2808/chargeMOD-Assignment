import 'dart:developer';

import 'package:chargemod_assignment/features/LoginScreens/Widgets/phone_number_screen.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_bloc.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_event.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_state.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage3 extends StatefulWidget {
  const WelcomePage3({Key? key}) : super(key: key);

  @override
  State<WelcomePage3> createState() => _WelcomePage3State();
}

class _WelcomePage3State extends State<WelcomePage3> {

  WelcomeBloc welcomeBloc = WelcomeBloc();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: BlocConsumer<WelcomeBloc, WelcomeState>(
        bloc: welcomeBloc,
        listener: (context, state){
          if(state is NavigateToLoginPageState){
            log("Navigate to login page");
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => PhoneNumberScreen()), (route) => false);
          } else if (state is NavigateToSecondPageState){
            log("Navigate to 2nd page");
            Navigator.pop(context);
          }
        },
        builder: (context, state){
          return SafeArea(
            child: Stack(
              children: [
                SvgPicture.asset("assets/images/welcome_pages_bg.svg"),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  height: height,
                  width: width,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          welcomeBloc.add(NavigateToLoginPageEvent());
                        },
                        child: Container(
                          child: Text("SKIP", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500),),
                          alignment: Alignment.topRight,
                        ),
                      ),
                      SizedBox(height: height/6,),
                      Text("Interaction with Grid", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 16),),
                      Text("RealTime", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 40),),
                      Text("Monitoring", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 40, color: ColorConstants.chargemodOrange),),
                      SizedBox(height: height *0.01,),
                      Image.asset("assets/images/welcome_page_3_monitor.png", height: height/3.8),
                      SizedBox(height: height *0.03,),
                      Text("Intelligent Sensible Devices", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      Text("Ambicharge Series", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      SizedBox(height: height *0.05,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                welcomeBloc.add(NavigateToSecondPageEvent());
                              },
                              child: Container(
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    color: ColorConstants.chargemodOrange,
                                    shape: BoxShape.circle
                                ),
                                child: Icon(Icons.arrow_back_ios, color: ColorConstants.white,size: 16,),
                              ),
                            ),
                            DotsIndicator(
                              dotsCount: 3,
                              position: 2,
                              decorator: const DotsDecorator(
                                  size: const Size(8.0, 9.0),
                                  activeSize: const Size(12.0, 15.0),
                                  activeColor: ColorConstants.chargemodBlack,
                                  color: ColorConstants.chargemodGrey
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                welcomeBloc.add(NavigateToLoginPageEvent());
                              },
                              child: Container(
                                height: 52,
                                width: 52,
                                decoration: BoxDecoration(
                                    color: ColorConstants.chargemodOrange,
                                    shape: BoxShape.circle
                                ),
                                child: Icon(Icons.arrow_forward_ios, color: ColorConstants.white,size: 16,),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
