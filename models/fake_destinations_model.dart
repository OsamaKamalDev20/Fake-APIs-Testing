// To parse this JSON data, do
//
//     final fakeDestinationsModel = fakeDestinationsModelFromJson(jsonString);

import 'dart:convert';

List<FakeDestinationsModel> fakeDestinationsModelFromJson(String str) =>
    List<FakeDestinationsModel>.from(
        json.decode(str).map((x) => FakeDestinationsModel.fromJson(x)));

String fakeDestinationsModelToJson(List<FakeDestinationsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeDestinationsModel {
  int id;
  String name;
  String country;
  Continent continent;
  String description;
  String image;
  String population;
  String currency;
  String language;
  String bestTimeToVisit;
  List<String> topAttractions;
  List<String> localDishes;
  List<String> activities;

  FakeDestinationsModel({
    required this.id,
    required this.name,
    required this.country,
    required this.continent,
    required this.description,
    required this.image,
    required this.population,
    required this.currency,
    required this.language,
    required this.bestTimeToVisit,
    required this.topAttractions,
    required this.localDishes,
    required this.activities,
  });

  factory FakeDestinationsModel.fromJson(Map<String, dynamic> json) =>
      FakeDestinationsModel(
        id: json["id"],
        name: json["name"],
        country: json["country"],
        continent: continentValues.map[json["continent"]]!,
        description: json["description"],
        image: json["image"],
        population: json["population"],
        currency: json["currency"],
        language: json["language"],
        bestTimeToVisit: json["best_time_to_visit"],
        topAttractions:
            List<String>.from(json["top_attractions"].map((x) => x)),
        localDishes: List<String>.from(json["local_dishes"].map((x) => x)),
        activities: List<String>.from(json["activities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "country": country,
        "continent": continentValues.reverse[continent],
        "description": description,
        "image": image,
        "population": population,
        "currency": currency,
        "language": language,
        "best_time_to_visit": bestTimeToVisit,
        "top_attractions": List<dynamic>.from(topAttractions.map((x) => x)),
        "local_dishes": List<dynamic>.from(localDishes.map((x) => x)),
        "activities": List<dynamic>.from(activities.map((x) => x)),
      };
}

enum Continent { AFRICA, ASIA, EUROPE, NORTH_AMERICA, OCEANIA, SOUTH_AMERICA }

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
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
