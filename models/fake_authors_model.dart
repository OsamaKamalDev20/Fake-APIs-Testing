// To parse this JSON data, do
//
//     final fakeAuthorsModel = fakeAuthorsModelFromJson(jsonString);

import 'dart:convert';

List<FakeAuthorsModel> fakeAuthorsModelFromJson(String str) =>
    List<FakeAuthorsModel>.from(
        json.decode(str).map((x) => FakeAuthorsModel.fromJson(x)));

String fakeAuthorsModelToJson(List<FakeAuthorsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeAuthorsModel {
  int id;
  String name;
  dynamic birthYear;
  dynamic deathYear;
  String nationality;
  List<String> genre;
  List<String> notableWorks;
  String award;
  String biography;
  String image;

  FakeAuthorsModel({
    required this.id,
    required this.name,
    required this.birthYear,
    this.deathYear,
    required this.nationality,
    required this.genre,
    required this.notableWorks,
    required this.award,
    required this.biography,
    required this.image,
  });

  factory FakeAuthorsModel.fromJson(Map<String, dynamic> json) =>
      FakeAuthorsModel(
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
