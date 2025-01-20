// To parse this JSON data, do
//
//     final fakeUnitedStatesModel = fakeUnitedStatesModelFromJson(jsonString);

import 'dart:convert';

List<FakeUnitedStatesModel> fakeUnitedStatesModelFromJson(String str) =>
    List<FakeUnitedStatesModel>.from(
        json.decode(str).map((x) => FakeUnitedStatesModel.fromJson(x)));

String fakeUnitedStatesModelToJson(List<FakeUnitedStatesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeUnitedStatesModel {
  int id;
  String name;
  String abbreviation;
  String capital;
  String largestCity;
  int population;
  int areaSqMiles;
  TimeZone timeZone;

  FakeUnitedStatesModel({
    required this.id,
    required this.name,
    required this.abbreviation,
    required this.capital,
    required this.largestCity,
    required this.population,
    required this.areaSqMiles,
    required this.timeZone,
  });

  factory FakeUnitedStatesModel.fromJson(Map<String, dynamic> json) =>
      FakeUnitedStatesModel(
        id: json["id"],
        name: json["name"],
        abbreviation: json["abbreviation"],
        capital: json["capital"],
        largestCity: json["largest_city"],
        population: json["population"],
        areaSqMiles: json["area_sq_miles"],
        timeZone: timeZoneValues.map[json["time_zone"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "abbreviation": abbreviation,
        "capital": capital,
        "largest_city": largestCity,
        "population": population,
        "area_sq_miles": areaSqMiles,
        "time_zone": timeZoneValues.reverse[timeZone],
      };
}

enum TimeZone {
  ALASKA_TIME_ZONE,
  CENTRAL_TIME_ZONE,
  EASTERN_TIME_ZONE,
  HAWAII_ALEUTIAN_TIME_ZONE,
  MOUNTAIN_TIME_ZONE,
  PACIFIC_TIME_ZONE
}

final timeZoneValues = EnumValues({
  "Alaska Time Zone": TimeZone.ALASKA_TIME_ZONE,
  "Central Time Zone": TimeZone.CENTRAL_TIME_ZONE,
  "Eastern Time Zone": TimeZone.EASTERN_TIME_ZONE,
  "Hawaii-Aleutian Time Zone": TimeZone.HAWAII_ALEUTIAN_TIME_ZONE,
  "Mountain Time Zone": TimeZone.MOUNTAIN_TIME_ZONE,
  "Pacific Time Zone": TimeZone.PACIFIC_TIME_ZONE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
