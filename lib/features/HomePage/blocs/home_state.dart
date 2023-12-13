import 'package:chargemod_assignment/features/HomePage/Models/ChargerLocation.dart';

class HomeState{}

class HomeActionState extends HomeState{}

class HomeInitialState extends HomeState{}

class HomeLocationChargersLoadingState extends HomeState{}

class HomeLocationChargersLoadedSuccessfullyState extends HomeState{
  List<ChargerLocation> chargerLocations;
  HomeLocationChargersLoadedSuccessfullyState({required this.chargerLocations});
}