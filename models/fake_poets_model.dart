// To parse this JSON data, do
//
//     final fakePoetsModel = fakePoetsModelFromJson(jsonString);

import 'dart:convert';

List<FakePoetsModel> fakePoetsModelFromJson(String str) =>
    List<FakePoetsModel>.from(
        json.decode(str).map((x) => FakePoetsModel.fromJson(x)));

String fakePoetsModelToJson(List<FakePoetsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakePoetsModel {
  int id;
  String name;
  int birthYear;
  int? deathYear;
  String nationality;
  List<String> genre;
  List<String> notableWorks;
  String award;
  String biography;
  String image;

  FakePoetsModel({
    required this.id,
    required this.name,
    required this.birthYear,
    required this.deathYear,
    required this.nationality,
    required this.genre,
    required this.notableWorks,
    required this.award,
    required this.biography,
    required this.image,
  });

  factory FakePoetsModel.fromJson(Map<String, dynamic> json) => FakePoetsModel(
        id: json["id"],
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
        nationality: json["nationality"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        notableWorks: List<String>.from(json["notable_works"].map((x) => x)),
        award: json["award"],
        biography: json["biography"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
        "nationality": nationality,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "notable_works": List<dynamic>.from(notableWorks.map((x) => x)),
        "award": award,
        "biography": biography,
        "image": image,
      };
}
