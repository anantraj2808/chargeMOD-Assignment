import 'dart:async';
import 'dart:developer';

import 'package:chargemod_assignment/features/LoginScreens/blocs/otp_bloc.dart';
import 'package:chargemod_assignment/features/LoginScreens/blocs/otp_event.dart';
import 'package:chargemod_assignment/features/LoginScreens/blocs/otp_state.dart';
import 'package:chargemod_assignment/features/UpdateProfile/Widgets/update_profile_screen.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  final String isoCode;
  final String phoneNumber;
  const OTPScreen({Key? key, required this.isoCode, required this.phoneNumber}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  TextEditingController otpTEC = TextEditingController();
  StreamController<ErrorAnimationType>? errorController;
  OTPBloc otpBloc = OTPBloc();
  bool isResendOTPButtonActive = true;

  @override
  void dispose() {
    super.dispose();
    otpTEC.dispose();
  }

  timer30Seconds() async {
    setState(() {
      isResendOTPButtonActive = false;
    });
    await Future.delayed(Duration(seconds: 30));
    setState(() {
      isResendOTPButtonActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: ColorConstants.chargemodBlack,size: 20,)),
        title: Text("Verification", style: TextStyle(color: ColorConstants.chargemodBlack, fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Poppins"),),
      ),
      body: BlocConsumer<OTPBloc, OTPState>(
        bloc: otpBloc,
        listener: (context, state){
          if(state is OTPVerifiedSuccessfullyState){
            log("OTP Verified Successfully");
          } else if(state is OTPVerificationFailedState){
            log("OTP Verification Failed");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
          } else if(state is OTPResentSuccessfullyState){
            log("OTP Resent Successfully");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("OTP sent again")));
          } else if (state is OTPResendingFailedState){
            log("OTP Resending failed");
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
          } else if (state is NavigateToProfileDetailsState){
            Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => UpdateProfileScreen(phoneNumber: widget.phoneNumber,)), (route) => false);
          } else if (state is NavigateToHomeState){

          }
        },
        builder: (context, state){
          switch(state.runtimeType){
            case OTPInitialState:
              return SafeArea(
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      Text("We’ve send you the verification\ncode on +${widget.isoCode} ${widget.phoneNumber}", style: TextStyle(color: ColorConstants.chargemodBlack, fontSize: 14, fontWeight: FontWeight.w400, fontFamily: "ABeeZee"),textAlign: TextAlign.center,),
                      SizedBox(height: 20,),
                      Container(
                        width: 250,
                        child: PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          textStyle: TextStyle(color: ColorConstants.chargemodBlack, fontFamily: "Poppins", fontWeight: FontWeight.w400, fontSize: 24),
                          animationType: AnimationType.fade,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                          ],
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            fieldHeight: 55,
                            fieldWidth: 55,
                            activeFillColor: Colors.white,
                            activeColor: Color(0xffD4E3E7),
                            disabledColor: Colors.black,
                            inactiveColor: Color(0xffECECEC),
                            selectedColor: Colors.black,
                            selectedFillColor: Color(0xffF7F8F9),
                            inactiveFillColor: Color(0xffF7F8F9),
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          errorAnimationController: errorController,
                          controller: otpTEC,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            return true;
                          },
                          appContext: context,
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: (){
                          if(isResendOTPButtonActive){
                            timer30Seconds();
                            otpBloc.add(ResendOTPEvent(phoneNumber: widget.phoneNumber));
                          }
                        },
                          child: Text("Resend OTP${isResendOTPButtonActive ? "" : " (Wait for 30 secs)"}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, fontFamily: "Poppins", color: isResendOTPButtonActive ? ColorConstants.chargemodOrange : ColorConstants.chargemodGrey),)),
                      Spacer(),
                      GestureDetector(
                        onTap: (){
                          //otpBloc.add(VerifyOTPEvent(otp: otpTEC.text, phoneNumber: widget.phoneNumber));
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => UpdateProfileScreen(phoneNumber: widget.phoneNumber,)), (route) => false);
                        },
                        child: Container(
                          height: 43,
                          width: 273,
                          decoration: BoxDecoration(
                              color: ColorConstants.chargemodOrange,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  fontFamily: "ABeeZee"),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            case VerifyingOTPState:
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.chargemodOrange),),);
            case ResendingOTPState:
              return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.chargemodOrange),),);
            default:
              return Container();
          }
        },
        buildWhen: (prev, current){
          return current is !OTPActionState;
        },
        listenWhen: (prev, current){
          return current is OTPActionState;
        },
      ),
    );
  }
}
