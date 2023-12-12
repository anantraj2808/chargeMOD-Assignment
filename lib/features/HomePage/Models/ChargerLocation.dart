class ChargerLocation{
  String? name;
  double? latitude;
  double? longitude;
  String? street1;
  String? street2;
  String? city;
  String? state;

  ChargerLocation(
      {this.name,
      this.latitude,
      this.longitude,
      this.street1,
      this.street2,
      this.city,
      this.state});

  factory ChargerLocation.fromJson(Map<String, dynamic> json) {
    return ChargerLocation(
      name: json["name"],
      latitude: json["geoLocation"]["coordinates"][0],
      longitude: json["geoLocation"]["coordinates"][1],
      street1: json["street1"],
      street2: json["street2"],
      city: json["city"],
      state: json["state"],
    );
  }
}