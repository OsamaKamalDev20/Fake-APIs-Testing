// To parse this JSON data, do
//
//     final fakeAnimalsModel = fakeAnimalsModelFromJson(jsonString);

import 'dart:convert';

List<FakeAnimalsModel> fakeAnimalsModelFromJson(String str) =>
    List<FakeAnimalsModel>.from(
        json.decode(str).map((x) => FakeAnimalsModel.fromJson(x)));

String fakeAnimalsModelToJson(List<FakeAnimalsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeAnimalsModel {
  int id;
  String name;
  String species;
  String family;
  String habitat;
  String placeOfFound;
  Diet diet;
  String description;
  double weightKg;
  int heightCm;
  String image;

  FakeAnimalsModel({
    required this.id,
    required this.name,
    required this.species,
    required this.family,
    required this.habitat,
    required this.placeOfFound,
    required this.diet,
    required this.description,
    required this.weightKg,
    required this.heightCm,
    required this.image,
  });

  factory FakeAnimalsModel.fromJson(Map<String, dynamic> json) =>
      FakeAnimalsModel(
        id: json["id"],
        name: json["name"],
        species: json["species"],
        family: json["family"],
        habitat: json["habitat"],
        placeOfFound: json["place_of_found"],
        diet: dietValues.map[json["diet"]]!,
        description: json["description"],
        weightKg: json["weight_kg"]?.toDouble(),
        heightCm: json["height_cm"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "species": species,
        "family": family,
        "habitat": habitat,
        "place_of_found": placeOfFound,
        "diet": dietValues.reverse[diet],
        "description": description,
        "weight_kg": weightKg,
        "height_cm": heightCm,
        "image": image,
      };
}

enum Diet { CARNIVORE, HERBIVORE, INSECTIVORE, OMNIVORE }

final dietValues = EnumValues({
  "Carnivore": Diet.CARNIVORE,
  "Herbivore": Diet.HERBIVORE,
  "Insectivore": Diet.INSECTIVORE,
  "Omnivore": Diet.OMNIVORE
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
