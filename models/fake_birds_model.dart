// To parse this JSON data, do
//
//     final fakeBirdsModel = fakeBirdsModelFromJson(jsonString);

import 'dart:convert';

List<FakeBirdsModel> fakeBirdsModelFromJson(String str) =>
    List<FakeBirdsModel>.from(
        json.decode(str).map((x) => FakeBirdsModel.fromJson(x)));

String fakeBirdsModelToJson(List<FakeBirdsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeBirdsModel {
  int id;
  String name;
  String species;
  String family;
  String habitat;
  String placeOfFound;
  String diet;
  String description;
  int? wingspanCm;
  double weightKg;
  String image;
  int? heightCm;

  FakeBirdsModel({
    required this.id,
    required this.name,
    required this.species,
    required this.family,
    required this.habitat,
    required this.placeOfFound,
    required this.diet,
    required this.description,
    this.wingspanCm,
    required this.weightKg,
    required this.image,
    this.heightCm,
  });

  factory FakeBirdsModel.fromJson(Map<String, dynamic> json) => FakeBirdsModel(
        id: json["id"],
        name: json["name"],
        species: json["species"],
        family: json["family"],
        habitat: json["habitat"],
        placeOfFound: json["place_of_found"],
        diet: json["diet"],
        description: json["description"],
        wingspanCm: json["wingspan_cm"],
        weightKg: json["weight_kg"]?.toDouble(),
        image: json["image"],
        heightCm: json["height_cm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "species": species,
        "family": family,
        "habitat": habitat,
        "place_of_found": placeOfFound,
        "diet": diet,
        "description": description,
        "wingspan_cm": wingspanCm,
        "weight_kg": weightKg,
        "image": image,
        "height_cm": heightCm,
      };
}
