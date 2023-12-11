import 'dart:developer';

import 'package:chargemod_assignment/features/LoginScreens/Widgets/phone_number_screen.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/Widgets/welcome_page_3.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_bloc.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_event.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_state.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage2 extends StatefulWidget {
  const WelcomePage2({Key? key}) : super(key: key);

  @override
  State<WelcomePage2> createState() => _WelcomePage2State();
}

class _WelcomePage2State extends State<WelcomePage2> {

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
          } else if (state is NavigateToFirstPageState){
            log("Navigate to 1st page");
            Navigator.pop(context);
          } else if (state is NavigateToThirdPageState){
            log("Navigate to 3rd page");
            Navigator.push(context, CupertinoPageRoute(builder: (conext) => WelcomePage3()));
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
                      Text("Easy EV Navigation", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 16),),
                      Text("Travel Route", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 40),),
                      Text("For Electrics", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 40, color: ColorConstants.chargemodOrange),),
                      SizedBox(height: height *0.01,),
                      SvgPicture.asset("assets/images/welcome_page_2_route.svg", height: height/4,),
                      SizedBox(height: height *0.03,),
                      Text("Grab The Best In Class", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      Text("Digital Experience Crafted For", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      Text("EV Drivers", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      SizedBox(height: height *0.05,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: (){
                                welcomeBloc.add(NavigateToFirstPageEvent());
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
                              position: 1,
                              decorator: const DotsDecorator(
                                  size: const Size(8.0, 9.0),
                                  activeSize: const Size(12.0, 15.0),
                                  activeColor: ColorConstants.chargemodBlack,
                                  color: ColorConstants.chargemodGrey
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                welcomeBloc.add(NavigateToThirdPageEvent());
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
