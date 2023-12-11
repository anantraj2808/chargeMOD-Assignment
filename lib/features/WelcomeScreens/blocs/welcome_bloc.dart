import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_event.dart';
import 'package:chargemod_assignment/features/WelcomeScreens/blocs/welcome_state.dart';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState>{
  WelcomeBloc() : super(WelcomeInitialState()){
    on<NavigateToFirstPageEvent>((event, emit) => emit(NavigateToFirstPageState()));
    on<NavigateToSecondPageEvent>((event, emit) => emit(NavigateToSecondPageState()));
    on<NavigateToThirdPageEvent>((event, emit) => emit(NavigateToThirdPageState()));
    on<NavigateToLoginPageEvent>(navigateToLoginPageEvent);
  }

  FutureOr<void> navigateToLoginPageEvent(NavigateToLoginPageEvent event, Emitter<WelcomeState> emit) async {
    SharedPrefs().setBooleanIntoCache(SharedPrefs.isAlreadyInstalledApp, true);
    emit(NavigateToLoginPageState());
  }
}