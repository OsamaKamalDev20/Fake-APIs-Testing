// To parse this JSON data, do
//
//     final fakePoliticianModel = fakePoliticianModelFromJson(jsonString);

import 'dart:convert';

List<FakePoliticianModel> fakePoliticianModelFromJson(String str) =>
    List<FakePoliticianModel>.from(
        json.decode(str).map((x) => FakePoliticianModel.fromJson(x)));

String fakePoliticianModelToJson(List<FakePoliticianModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakePoliticianModel {
  int id;
  String name;
  String dob;
  String country;
  String party;
  String position;
  String yearsInOffice;
  String image;
  String biography;

  FakePoliticianModel({
    required this.id,
    required this.name,
    required this.dob,
    required this.country,
    required this.party,
    required this.position,
    required this.yearsInOffice,
    required this.image,
    required this.biography,
  });

  factory FakePoliticianModel.fromJson(Map<String, dynamic> json) =>
      FakePoliticianModel(
        id: json["id"],
        name: json["name"],
        dob: json["dob"],
        country: json["country"],
        party: json["party"],
        position: json["position"],
        yearsInOffice: json["years_in_office"],
        image: json["image"],
        biography: json["biography"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "dob": dob,
        "country": country,
        "party": party,
        "position": position,
        "years_in_office": yearsInOffice,
        "image": image,
        "biography": biography,
      };
}
