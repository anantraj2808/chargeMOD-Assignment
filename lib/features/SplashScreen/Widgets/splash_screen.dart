import 'dart:developer';
import 'package:chargemod_assignment/features/HomePage/Widgets/home_page.dart';
import 'package:chargemod_assignment/features/LoginScreens/Widgets/phone_number_screen.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/Widgets/welcome_page_2.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/Widgets/welcome_page_1.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:chargemod_assignment/features/SplashScreen/blocs/app_init_bloc.dart';
import 'package:chargemod_assignment/features/SplashScreen/blocs/app_init_event.dart';
import 'package:chargemod_assignment/features/SplashScreen/blocs/app_init_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  InternetBloc internetBloc = InternetBloc();

  @override
  void initState() {
    super.initState();
    internetBloc.add(AppInitInternetCheckEvent());
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<InternetBloc, AppInitState>(
      bloc: internetBloc,
        listener: (context, state){
          if(state is AppInitInternetStableState){
            log("Internet connectivity checked");
            Future.delayed(const Duration(seconds: 5)).then((value){
              internetBloc.add(AppInitRedirectionCheckEvent());
            });
          } else if(state is AppInitInternetUnstableState){
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please check your internet connection or try restarting the app."),
                  backgroundColor: ColorConstants.red,
                )
            );
          } else if(state is AppInitUserLoggedInState){
            log("Redirect to home page");
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => HomePage()), (route) => false);
          } else if(state is AppInitUserLoggedOutState){
            log("Redirect to login page");
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => PhoneNumberScreen()), (route) => false);
          } else if(state is AppInitFreshInstallState){
            log("Redirect to Welcome Screens");
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (conext) => WelcomePage1()));
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorConstants.white,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: height*0.4,),
                  Container(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(
                        "assets/images/splash_screen_logo.svg",
                        semanticsLabel: 'chargeMOD Logo'
                    ),
                  ),
                  SizedBox(height: height*0.3,),
                  if(state is AppInitInternetStableState)...[
                    SizedBox(
                      width: 250,
                      child: LinearPercentIndicator(
                        animation: true,
                        animationDuration: 5000,
                        lineHeight: 5,
                        percent: 1,
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: ColorConstants.chargemodOrange,
                        backgroundColor: ColorConstants.chargemodLightestGrey,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Connecting to chargeMOD", style: TextStyle(fontFamily: "Poppins", fontWeight: FontWeight.w500, color: ColorConstants.chargemodGrey, fontSize: 14),)
                  ]
                ],
              ),
            ),
          );
        }
    );
  }
}
