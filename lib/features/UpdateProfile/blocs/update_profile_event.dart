class UpdateProfileEvent{}

class UpdateProfileInitialEvent extends UpdateProfileEvent{}

class SaveUpdatedProfileEvent extends UpdateProfileEvent{
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  SaveUpdatedProfileEvent({required this.firstName, required this.lastName, required this.email, required this.phoneNumber});
}