import 'dart:async';
import 'dart:developer';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_init_event.dart';
import 'app_init_state.dart';

class InternetBloc extends Bloc<AppInitEvent, AppInitState>{

  InternetBloc(): super(AppInitInitialState()){
    on<AppInitInternetCheckEvent>(appInitInternetCheckEvent);
    on<AppInitRedirectionCheckEvent>(appInitRedirectionCheckEvent);
  }

  FutureOr<void> appInitInternetCheckEvent(AppInitInternetCheckEvent event, Emitter<AppInitState> emit) async {
    ConnectivityResult connectivityResult = await Connectivity().checkConnectivity();// User defined class
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      emit(AppInitInternetStableState());
    } else {
      emit(AppInitInternetUnstableState());
    }
  }

  FutureOr<void> appInitRedirectionCheckEvent(AppInitRedirectionCheckEvent event, Emitter<AppInitState> emit) async {
    bool isAlreadyInstalledApp = await SharedPrefs().getBooleanFromCache(SharedPrefs.isAlreadyInstalledApp);
    if(!isAlreadyInstalledApp){
      emit(AppInitFreshInstallState());
    } else {
      bool isUserLoggedIn = await SharedPrefs().getBooleanFromCache(SharedPrefs.isUserLoggedIn);
      if(isUserLoggedIn){
        emit(AppInitUserLoggedInState());
      } else {
        emit(AppInitUserLoggedOutState());
      }
    }
  }
}