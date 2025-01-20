// To parse this JSON data, do
//
//     final fakeAirlinesModel = fakeAirlinesModelFromJson(jsonString);

import 'dart:convert';

List<FakeAirlinesModel> fakeAirlinesModelFromJson(String str) =>
    List<FakeAirlinesModel>.from(
        json.decode(str).map((x) => FakeAirlinesModel.fromJson(x)));

String fakeAirlinesModelToJson(List<FakeAirlinesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeAirlinesModel {
  int id;
  String name;
  String code;
  String country;
  String founded;
  String fleetSize;
  String headquarters;
  String website;
  List<Destination> destinations;

  FakeAirlinesModel({
    required this.id,
    required this.name,
    required this.code,
    required this.country,
    required this.founded,
    required this.fleetSize,
    required this.headquarters,
    required this.website,
    required this.destinations,
  });

  factory FakeAirlinesModel.fromJson(Map<String, dynamic> json) =>
      FakeAirlinesModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        country: json["country"],
        founded: json["founded"],
        fleetSize: json["fleet_size"],
        headquarters: json["headquarters"],
        website: json["website"],
        destinations: List<Destination>.from(
            json["destinations"].map((x) => Destination.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "country": country,
        "founded": founded,
        "fleet_size": fleetSize,
        "headquarters": headquarters,
        "website": website,
        "destinations": List<dynamic>.from(destinations.map((x) => x.toJson())),
      };
}

class Destination {
  String name;
  String code;

  Destination({
    required this.name,
    required this.code,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}
