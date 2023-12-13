import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chargemod_assignment/features/ProfilePage/Models/user_profile.dart';
import 'package:chargemod_assignment/features/ProfilePage/blocs/profile_event.dart';
import 'package:chargemod_assignment/features/ProfilePage/blocs/profile_state.dart';
import 'package:chargemod_assignment/features/ProfilePage/repository/profile_repo.dart';
import 'package:chargemod_assignment/utilities/shared_prefs.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState>{
  ProfileBloc() : super(ProfileInitialState()){
    on<ProfileInitialEvent>(profileInitialEvent);
    on<ProfileLogoutEvent>(profileLogoutEvent);
  }

  FutureOr<void> profileInitialEvent(ProfileInitialEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileDetailsLoadingState());

    //API call
    UserProfile userProfile = await ProfileRepo.getUserProfile();

    emit(ProfileDetailsLoadedSuccessfullyState(userProfile: userProfile));
  }

  FutureOr<void> profileLogoutEvent(ProfileLogoutEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoggingOutState());

    //API call
    bool isLoggedOut = await ProfileRepo.logout();

    if(isLoggedOut){
      SharedPrefs().removeStringFromCache(SharedPrefs.authToken);
      SharedPrefs().removeStringFromCache(SharedPrefs.refreshToken);
      SharedPrefs().removeStringFromCache(SharedPrefs.userId);
      SharedPrefs().setBooleanIntoCache(SharedPrefs.isUserLoggedIn, false);
      emit(ProfileLoggedOutSuccessfullyState());
    }
  }
}