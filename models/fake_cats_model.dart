// To parse this JSON data, do
//
//     final fakeCatsModel = fakeCatsModelFromJson(jsonString);

import 'dart:convert';

List<FakeCatsModel> fakeCatsModelFromJson(String str) =>
    List<FakeCatsModel>.from(
        json.decode(str).map((x) => FakeCatsModel.fromJson(x)));

String fakeCatsModelToJson(List<FakeCatsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeCatsModel {
  int id;
  String name;
  String origin;
  String temperament;
  List<String> colors;
  String description;
  String image;

  FakeCatsModel({
    required this.id,
    required this.name,
    required this.origin,
    required this.temperament,
    required this.colors,
    required this.description,
    required this.image,
  });

  factory FakeCatsModel.fromJson(Map<String, dynamic> json) => FakeCatsModel(
        id: json["id"],
        name: json["name"],
        origin: json["origin"],
        temperament: json["temperament"],
        colors: List<String>.from(json["colors"].map((x) => x)),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "origin": origin,
        "temperament": temperament,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "description": description,
        "image": image,
      };
}
