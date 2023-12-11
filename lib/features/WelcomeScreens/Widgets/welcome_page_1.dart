import 'dart:developer';

import 'package:chargemod_assignment/features/LoginScreens/Widgets/phone_number_screen.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/Widgets/welcome_page_2.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_bloc.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_event.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_state.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class WelcomePage1 extends StatefulWidget {
  const WelcomePage1({Key? key}) : super(key: key);

  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {

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
          if(state is NavigateToSecondPageState){
            log("Navigate to 2nd Page");
            Navigator.push(context, CupertinoPageRoute(builder: (context) => WelcomePage2()));
          } else if(state is NavigateToLoginPageState){
            log("Navigate to login page");
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => PhoneNumberScreen()), (route) => false);
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
                      Text("Charge your EV", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, fontSize: 16),),
                      Text("At Your", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 40),),
                      Text("Fingertips", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w700, fontSize: 40, color: ColorConstants.chargemodOrange),),
                      SizedBox(height: height *0.05,),
                      SvgPicture.asset("assets/images/welcome_page_1_bike.svg", width: width-35,),
                      SizedBox(height: height *0.05,),
                      Text("Scan Charge and Go", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      Text("Effortless Charging schemas", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 15),),
                      SizedBox(height: height *0.05,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(width: 52,),
                            DotsIndicator(
                              dotsCount: 3,
                              position: 0,
                              decorator: const DotsDecorator(
                                  size: const Size(8.0, 9.0),
                                  activeSize: const Size(12.0, 15.0),
                                  activeColor: ColorConstants.chargemodBlack,
                                  color: ColorConstants.chargemodGrey
                              ),
                            ),
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
