// To parse this JSON data, do
//
//     final fakeCurrenciesModel = fakeCurrenciesModelFromJson(jsonString);

import 'dart:convert';

List<FakeCurrenciesModel> fakeCurrenciesModelFromJson(String str) =>
    List<FakeCurrenciesModel>.from(
        json.decode(str).map((x) => FakeCurrenciesModel.fromJson(x)));

String fakeCurrenciesModelToJson(List<FakeCurrenciesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeCurrenciesModel {
  int id;
  String name;
  String code;
  String symbol;
  double exchangeRate;
  List<String> countries;
  List<String> subunits;
  String description;
  String image;

  FakeCurrenciesModel({
    required this.id,
    required this.name,
    required this.code,
    required this.symbol,
    required this.exchangeRate,
    required this.countries,
    required this.subunits,
    required this.description,
    required this.image,
  });

  factory FakeCurrenciesModel.fromJson(Map<String, dynamic> json) =>
      FakeCurrenciesModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        symbol: json["symbol"],
        exchangeRate: json["exchange_rate"]?.toDouble(),
        countries: List<String>.from(json["countries"].map((x) => x)),
        subunits: List<String>.from(json["subunits"].map((x) => x)),
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "symbol": symbol,
        "exchange_rate": exchangeRate,
        "countries": List<dynamic>.from(countries.map((x) => x)),
        "subunits": List<dynamic>.from(subunits.map((x) => x)),
        "description": description,
        "image": image,
      };
}
