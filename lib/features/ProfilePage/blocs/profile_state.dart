import 'package:chargemod_assignment/features/ProfilePage/Models/user_profile.dart';

class ProfileState{}

class ProfileActionState extends ProfileState{}

class ProfileInitialState extends ProfileState{}

class ProfileDetailsLoadingState extends ProfileState{}

class ProfileLoggingOutState extends ProfileState{}

class ProfileLoggedOutSuccessfullyState extends ProfileActionState{}

class ProfileDetailsLoadedSuccessfullyState extends ProfileState{
  UserProfile userProfile;
  ProfileDetailsLoadedSuccessfullyState({required this.userProfile});
}