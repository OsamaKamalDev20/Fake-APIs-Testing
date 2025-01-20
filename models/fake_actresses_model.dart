// To parse this JSON data, do
//
//     final fakeActressesModel = fakeActressesModelFromJson(jsonString);

import 'dart:convert';

List<FakeActressesModel> fakeActressesModelFromJson(String str) =>
    List<FakeActressesModel>.from(
        json.decode(str).map((x) => FakeActressesModel.fromJson(x)));

String fakeActressesModelToJson(List<FakeActressesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeActressesModel {
  int id;
  String name;
  int birthYear;
  String nationality;
  List<String> mostFamousMovies;
  String awards;
  String biography;
  String image;
  int? deathYear;

  FakeActressesModel({
    required this.id,
    required this.name,
    required this.birthYear,
    required this.nationality,
    required this.mostFamousMovies,
    required this.awards,
    required this.biography,
    required this.image,
    this.deathYear,
  });

  factory FakeActressesModel.fromJson(Map<String, dynamic> json) =>
      FakeActressesModel(
        id: json["id"],
        name: json["name"],
        birthYear: json["birth_year"],
        nationality: json["nationality"],
        mostFamousMovies:
            List<String>.from(json["most_famous_movies"].map((x) => x)),
        awards: json["awards"],
        biography: json["biography"],
        image: json["image"],
        deathYear: json["death_year"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "birth_year": birthYear,
        "nationality": nationality,
        "most_famous_movies":
            List<dynamic>.from(mostFamousMovies.map((x) => x)),
        "awards": awards,
        "biography": biography,
        "image": image,
        "death_year": deathYear,
      };
}
