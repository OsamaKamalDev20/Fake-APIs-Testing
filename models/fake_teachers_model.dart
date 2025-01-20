// To parse this JSON data, do
//
//     final fakeTeachersModel = fakeTeachersModelFromJson(jsonString);

import 'dart:convert';

List<FakeTeachersModel> fakeTeachersModelFromJson(String str) =>
    List<FakeTeachersModel>.from(
        json.decode(str).map((x) => FakeTeachersModel.fromJson(x)));

String fakeTeachersModelToJson(List<FakeTeachersModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeTeachersModel {
  int id;
  String name;
  int age;
  Gender gender;
  Address address;
  String email;
  String phone;
  List<String> subjects;
  int yearsOfExperience;
  String image;

  FakeTeachersModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.address,
    required this.email,
    required this.phone,
    required this.subjects,
    required this.yearsOfExperience,
    required this.image,
  });

  factory FakeTeachersModel.fromJson(Map<String, dynamic> json) =>
      FakeTeachersModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: genderValues.map[json["gender"]]!,
        address: Address.fromJson(json["address"]),
        email: json["email"],
        phone: json["phone"],
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        yearsOfExperience: json["years_of_experience"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "age": age,
        "gender": genderValues.reverse[gender],
        "address": address.toJson(),
        "email": email,
        "phone": phone,
        "subjects": List<dynamic>.from(subjects.map((x) => x)),
        "years_of_experience": yearsOfExperience,
        "image": image,
      };
}

class Address {
  String street;
  String city;
  String zip;
  Country country;

  Address({
    required this.street,
    required this.city,
    required this.zip,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        zip: json["zip"],
        country: countryValues.map[json["country"]]!,
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "zip": zip,
        "country": countryValues.reverse[country],
      };
}

enum Country { USA }

final countryValues = EnumValues({"USA": Country.USA});

enum Gender { FEMALE, MALE }

final genderValues = EnumValues({"Female": Gender.FEMALE, "Male": Gender.MALE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
