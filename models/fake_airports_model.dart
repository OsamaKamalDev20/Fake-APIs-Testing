// To parse this JSON data, do
//
//     final fakeAirportModel = fakeAirportModelFromJson(jsonString);

import 'dart:convert';

List<FakeAirportModel> fakeAirportModelFromJson(String str) =>
    List<FakeAirportModel>.from(
        json.decode(str).map((x) => FakeAirportModel.fromJson(x)));

String fakeAirportModelToJson(List<FakeAirportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeAirportModel {
  int id;
  String name;
  String code;
  Location location;
  String city;
  String country;
  String timezone;
  List<Terminal> terminals;
  List<String> airlines;
  List<Service> services;
  ContactInfo contactInfo;

  FakeAirportModel({
    required this.id,
    required this.name,
    required this.code,
    required this.location,
    required this.city,
    required this.country,
    required this.timezone,
    required this.terminals,
    required this.airlines,
    required this.services,
    required this.contactInfo,
  });

  factory FakeAirportModel.fromJson(Map<String, dynamic> json) =>
      FakeAirportModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        location: Location.fromJson(json["location"]),
        city: json["city"],
        country: json["country"],
        timezone: json["timezone"],
        terminals: List<Terminal>.from(
            json["terminals"].map((x) => Terminal.fromJson(x))),
        airlines: List<String>.from(json["airlines"].map((x) => x)),
        services: List<Service>.from(
            json["services"].map((x) => serviceValues.map[x]!)),
        contactInfo: ContactInfo.fromJson(json["contact_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "location": location.toJson(),
        "city": city,
        "country": country,
        "timezone": timezone,
        "terminals": List<dynamic>.from(terminals.map((x) => x.toJson())),
        "airlines": List<dynamic>.from(airlines.map((x) => x)),
        "services":
            List<dynamic>.from(services.map((x) => serviceValues.reverse[x])),
        "contact_info": contactInfo.toJson(),
      };
}

class ContactInfo {
  String phone;
  String email;
  String website;

  ContactInfo({
    required this.phone,
    required this.email,
    required this.website,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        phone: json["phone"],
        email: json["email"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "email": email,
        "website": website,
      };
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

enum Service { ATM, CAR_RENTAL, PARKING, RESTAURANTS, SHOPS }

final serviceValues = EnumValues({
  "ATM": Service.ATM,
  "Car Rental": Service.CAR_RENTAL,
  "Parking": Service.PARKING,
  "Restaurants": Service.RESTAURANTS,
  "Shops": Service.SHOPS
});

class Terminal {
  String name;
  List<Gate> gates;

  Terminal({
    required this.name,
    required this.gates,
  });

  factory Terminal.fromJson(Map<String, dynamic> json) => Terminal(
        name: json["name"],
        gates: List<Gate>.from(json["gates"].map((x) => Gate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "gates": List<dynamic>.from(gates.map((x) => x.toJson())),
      };
}

class Gate {
  GateNumber gateNumber;
  List<String> airlines;

  Gate({
    required this.gateNumber,
    required this.airlines,
  });

  factory Gate.fromJson(Map<String, dynamic> json) => Gate(
        gateNumber: gateNumberValues.map[json["gate_number"]]!,
        airlines: List<String>.from(json["airlines"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "gate_number": gateNumberValues.reverse[gateNumber],
        "airlines": List<dynamic>.from(airlines.map((x) => x)),
      };
}

enum GateNumber { GATE_A1, GATE_A2, GATE_B1, GATE_B2, GATE_C1, GATE_C2 }

final gateNumberValues = EnumValues({
  "Gate A1": GateNumber.GATE_A1,
  "Gate A2": GateNumber.GATE_A2,
  "Gate B1": GateNumber.GATE_B1,
  "Gate B2": GateNumber.GATE_B2,
  "Gate C1": GateNumber.GATE_C1,
  "Gate C2": GateNumber.GATE_C2
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
