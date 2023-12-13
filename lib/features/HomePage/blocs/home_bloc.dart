import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chargemod_assignment/features/HomePage/Models/ChargerLocation.dart';
import 'package:chargemod_assignment/features/HomePage/blocs/home_event.dart';
import 'package:chargemod_assignment/features/HomePage/blocs/home_state.dart';
import 'package:chargemod_assignment/features/HomePage/repository/home_repo.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  HomeBloc() : super(HomeInitialState()){
    on<HomeInitialEvent>(homeInitialEvent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLocationChargersLoadingState());

    //API call
    List<ChargerLocation> locationsList = await HomeRepo.getLocations();

    emit(HomeLocationChargersLoadedSuccessfullyState(chargerLocations: locationsList));
  }
}