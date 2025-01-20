// To parse this JSON data, do
//
//     final fakeCountriesModel = fakeCountriesModelFromJson(jsonString);

import 'dart:convert';

List<FakeCountriesModel> fakeCountriesModelFromJson(String str) =>
    List<FakeCountriesModel>.from(
        json.decode(str).map((x) => FakeCountriesModel.fromJson(x)));

String fakeCountriesModelToJson(List<FakeCountriesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeCountriesModel {
  int id;
  String name;
  int population;
  double landArea;
  double density;
  String capital;
  String currency;
  String flag;

  FakeCountriesModel({
    required this.id,
    required this.name,
    required this.population,
    required this.landArea,
    required this.density,
    required this.capital,
    required this.currency,
    required this.flag,
  });

  factory FakeCountriesModel.fromJson(Map<String, dynamic> json) =>
      FakeCountriesModel(
        id: json["id"],
        name: json["name"],
        population: json["population"],
        landArea: json["land_area"]?.toDouble(),
        density: json["density"]?.toDouble(),
        capital: json["capital"],
        currency: json["currency"],
        flag: json["flag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "population": population,
        "land_area": landArea,
        "density": density,
        "capital": capital,
        "currency": currency,
        "flag": flag,
      };
}
