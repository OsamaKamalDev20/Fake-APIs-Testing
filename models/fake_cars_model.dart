// To parse this JSON data, do
//
//     final fakeCarsModel = fakeCarsModelFromJson(jsonString);

import 'dart:convert';

List<FakeCarsModel> fakeCarsModelFromJson(String str) =>
    List<FakeCarsModel>.from(
        json.decode(str).map((x) => FakeCarsModel.fromJson(x)));

String fakeCarsModelToJson(List<FakeCarsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeCarsModel {
  int id;
  String make;
  String model;
  int year;
  String color;
  int mileage;
  int price;
  FuelType fuelType;
  Transmission transmission;
  String engine;
  int horsepower;
  List<String> features;
  int owners;
  String image;

  FakeCarsModel({
    required this.id,
    required this.make,
    required this.model,
    required this.year,
    required this.color,
    required this.mileage,
    required this.price,
    required this.fuelType,
    required this.transmission,
    required this.engine,
    required this.horsepower,
    required this.features,
    required this.owners,
    required this.image,
  });

  factory FakeCarsModel.fromJson(Map<String, dynamic> json) => FakeCarsModel(
        id: json["id"],
        make: json["make"],
        model: json["model"],
        year: json["year"],
        color: json["color"],
        mileage: json["mileage"],
        price: json["price"],
        fuelType: fuelTypeValues.map[json["fuelType"]]!,
        transmission: transmissionValues.map[json["transmission"]]!,
        engine: json["engine"],
        horsepower: json["horsepower"],
        features: List<String>.from(json["features"].map((x) => x)),
        owners: json["owners"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "make": make,
        "model": model,
        "year": year,
        "color": color,
        "mileage": mileage,
        "price": price,
        "fuelType": fuelTypeValues.reverse[fuelType],
        "transmission": transmissionValues.reverse[transmission],
        "engine": engine,
        "horsepower": horsepower,
        "features": List<dynamic>.from(features.map((x) => x)),
        "owners": owners,
        "image": image,
      };
}

enum FuelType { DIESEL, ELECTRIC, GASOLINE }

final fuelTypeValues = EnumValues({
  "Diesel": FuelType.DIESEL,
  "Electric": FuelType.ELECTRIC,
  "Gasoline": FuelType.GASOLINE
});

enum Transmission { AUTOMATIC, CVT, MANUAL }

final transmissionValues = EnumValues({
  "Automatic": Transmission.AUTOMATIC,
  "CVT": Transmission.CVT,
  "Manual": Transmission.MANUAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
