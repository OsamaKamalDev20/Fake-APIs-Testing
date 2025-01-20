// To parse this JSON data, do
//
//     final fakeActorsModel = fakeActorsModelFromJson(jsonString);

import 'dart:convert';

List<FakeActorsModel> fakeActorsModelFromJson(String str) =>
    List<FakeActorsModel>.from(
        json.decode(str).map((x) => FakeActorsModel.fromJson(x)));

String fakeActorsModelToJson(List<FakeActorsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeActorsModel {
  int id;
  String name;
  int birthYear;
  int? deathYear;
  String nationality;
  List<String> knownFor;
  List<String> awards;
  String biography;
  String image;

  FakeActorsModel({
    required this.id,
    required this.name,
    required this.birthYear,
    this.deathYear,
    required this.nationality,
    required this.knownFor,
    required this.awards,
    required this.biography,
    required this.image,
  });

  factory FakeActorsModel.fromJson(Map<String, dynamic> json) =>
      FakeActorsModel(
        id: json["id"],
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
        nationality: json["nationality"],
        knownFor: List<String>.from(json["known_for"].map((x) => x)),
        awards: List<String>.from(json["awards"].map((x) => x)),
        biography: json["biography"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
        "nationality": nationality,
        "known_for": List<dynamic>.from(knownFor.map((x) => x)),
        "awards": List<dynamic>.from(awards.map((x) => x)),
        "biography": biography,
        "image": image,
      };
}
