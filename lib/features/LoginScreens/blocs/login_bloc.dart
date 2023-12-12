import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:chargemod_assignment/features/LoginScreens/blocs/login_event.dart';
import 'package:chargemod_assignment/features/LoginScreens/blocs/login_state.dart';
import 'package:chargemod_assignment/features/LoginScreens/repository/login_repo.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  LoginBloc() : super(LoginInitialState()){
    on<SendOTPEvent>(sendOTPEvent);
  }

  FutureOr<void> sendOTPEvent(SendOTPEvent event, Emitter<LoginState> emit) async {
    log("phoneNum = ${event.phoneNumber}");
    emit(SendingOTPState());
    bool isOTPSentSuccessfully = await LoginRepo.sendOTP(event.phoneNumber);
    emit(LoginInitialState());
    if(isOTPSentSuccessfully){
      emit(OTPSentSuccessfullyState());
    } else {
      emit(OTPSendingFailedState());
    }
  }
}