import 'dart:async';
import 'package:chargemod_assignment/features/UpdateProfile/repository/update_profile_repository.dart';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:chargemod_assignment/features/UpdateProfile/blocs/update_profile_event.dart';
import 'package:chargemod_assignment/features/UpdateProfile/blocs/update_profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState>{
  UpdateProfileBloc() : super(UpdateProfileInitialState()){
    on<UpdateProfileInitialEvent>((event, emit) => emit(UpdateProfileInitialState()));
    on<SaveUpdatedProfileEvent>(saveUpdatedProfileEvent);
  }

  FutureOr<void> saveUpdatedProfileEvent(SaveUpdatedProfileEvent event, Emitter<UpdateProfileState> emit) async {
    emit(SavingProfileState());

    http.Response response = await UpdateProfileRepo.registerUser(event.phoneNumber, event.firstName, event.lastName, event.email);
    if(response.statusCode == 200){
      SharedPrefs().setBooleanIntoCache(SharedPrefs.isUserLoggedIn, true);
      emit(ProfileSavedSuccessfullyState());
    }
  }
}