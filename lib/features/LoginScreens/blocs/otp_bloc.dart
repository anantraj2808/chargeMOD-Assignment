import 'dart:async';
import 'dart:convert';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:chargemod_assignment/features/LoginScreens/blocs/otp_event.dart';
import 'package:chargemod_assignment/features/LoginScreens/blocs/otp_state.dart';
import 'package:chargemod_assignment/features/LoginScreens/repository/login_repo.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState>{
  OTPBloc() : super(OTPInitialState()){
    on<VerifyOTPEvent>(verifyOTPEvent);
    on<ResendOTPEvent>(resendOTPEvent);
  }

  FutureOr<void> verifyOTPEvent(VerifyOTPEvent event, Emitter<OTPState> emit) async {
    emit(VerifyingOTPState());
    http.Response response = await LoginRepo.verifyOTP(event.phoneNumber, event.otp);
    emit(OTPInitialState());
    if(response.statusCode >= 200 && response.statusCode <= 300){
      var data = json.decode(response.body);
      String accessToken = data['data']['accessToken'];
      String refreshToken = data['data']['refreshToken'];
      String userId = data['data']['userId'];
      SharedPrefs().setStringIntoCache(SharedPrefs.authToken, accessToken);
      SharedPrefs().setStringIntoCache(SharedPrefs.refreshToken, refreshToken);
      SharedPrefs().setStringIntoCache(SharedPrefs.userId, userId);
      bool isNewUser = false;
      await LoginRepo.checkIfNewUser().then((value){
        var isNewUserData = json.decode(value.body);
        isNewUser = isNewUserData['data']['user'][0]['firstName'] == null || isNewUserData['data']['user'][0]['firstName'].toString().isEmpty;
      });
      if(isNewUser){
        emit(NavigateToProfileDetailsState());
      } else {
        SharedPrefs().setBooleanIntoCache(SharedPrefs.isUserLoggedIn, true);
        emit(NavigateToHomeState());
      }
    } else {
      emit(OTPVerificationFailedState());
    }
  }

  FutureOr<void> resendOTPEvent(ResendOTPEvent event, Emitter<OTPState> emit) async {
    emit(ResendingOTPState());
    bool isOTPResent = await LoginRepo.resendOTP(event.phoneNumber);
    emit(OTPInitialState());
    if(isOTPResent){
      emit(OTPResentSuccessfullyState());
    } else {
      emit(OTPResendingFailedState());
    }
  }
}