import 'dart:developer';

import 'package:chargemod_assignment/Utilities/color_constants.dart';
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
          } else if(state is AppInitUserLoggedOutState){
            log("Redirect to login page");
          } else if(state is AppInitFreshInstallState){
            log("Redirect to Welcome Screens");
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
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
