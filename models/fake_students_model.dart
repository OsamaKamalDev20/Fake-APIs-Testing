// To parse this JSON data, do
//
//     final fakeStudentsModel = fakeStudentsModelFromJson(jsonString);

import 'dart:convert';

List<FakeStudentsModel> fakeStudentsModelFromJson(String str) =>
    List<FakeStudentsModel>.from(
        json.decode(str).map((x) => FakeStudentsModel.fromJson(x)));

String fakeStudentsModelToJson(List<FakeStudentsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeStudentsModel {
  int id;
  String name;
  int age;
  Gender gender;
  Address address;
  String email;
  String phone;
  List<String> courses;
  double gpa;
  String image;

  FakeStudentsModel({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
    required this.address,
    required this.email,
    required this.phone,
    required this.courses,
    required this.gpa,
    required this.image,
  });

  factory FakeStudentsModel.fromJson(Map<String, dynamic> json) =>
      FakeStudentsModel(
        id: json["id"],
        name: json["name"],
        age: json["age"],
        gender: genderValues.map[json["gender"]]!,
        address: Address.fromJson(json["address"]),
        email: json["email"],
        phone: json["phone"],
        courses: List<String>.from(json["courses"].map((x) => x)),
        gpa: json["gpa"]?.toDouble(),
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
        "courses": List<dynamic>.from(courses.map((x) => x)),
        "gpa": gpa,
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

enum Country { JAPAN, SOUTH_KOREA, USA }

final countryValues = EnumValues({
  "Japan": Country.JAPAN,
  "South Korea": Country.SOUTH_KOREA,
  "USA": Country.USA
});

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
