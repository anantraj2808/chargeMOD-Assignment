class UserProfile{
  String? firstName;
  String? lastName;

  UserProfile({this.firstName, this.lastName});

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}