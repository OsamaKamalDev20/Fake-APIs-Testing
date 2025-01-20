// To parse this JSON data, do
//
//     final fakeUsersModel = fakeUsersModelFromJson(jsonString);

import 'dart:convert';

List<FakeUsersModel> fakeUsersModelFromJson(String str) =>
    List<FakeUsersModel>.from(
        json.decode(str).map((x) => FakeUsersModel.fromJson(x)));

String fakeUsersModelToJson(List<FakeUsersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeUsersModel {
  int id;
  String name;
  int age;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  String occupation;
  List<String> hobbies;

  FakeUsersModel({
    required this.id,
    required this.name,
    required this.age,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.occupation,
    required this.hobbies,
  });

  factory FakeUsersModel.fromJson(Map<String, dynamic> json) => FakeUsersModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        username: json["username"],
        email: json["email"],
        address: Address.fromJson(json["address"]),
        phone: json["phone"],
        website: json["website"],
        occupation: json["occupation"],
        hobbies: List<String>.from(json["hobbies"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "occupation": occupation,
        "hobbies": List<dynamic>.from(hobbies.map((x) => x)),
      };
}

class Address {
  String street;
  City city;
  String zip;

  Address({
    required this.street,
    required this.city,
    required this.zip,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: cityValues.map[json["city"]]!,
        zip: json["zip"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": cityValues.reverse[city],
        "zip": zip,
      };
}

enum City { CITYVILLE, TOWNSVILLE, VILLAGELAND }

final cityValues = EnumValues({
  "Cityville": City.CITYVILLE,
  "Townsville": City.TOWNSVILLE,
  "Villageland": City.VILLAGELAND
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
