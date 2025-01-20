// To parse this JSON data, do
//
//     final fakeLanguagesModel = fakeLanguagesModelFromJson(jsonString);

import 'dart:convert';

List<FakeLanguagesModel> fakeLanguagesModelFromJson(String str) =>
    List<FakeLanguagesModel>.from(
        json.decode(str).map((x) => FakeLanguagesModel.fromJson(x)));

String fakeLanguagesModelToJson(List<FakeLanguagesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeLanguagesModel {
  int id;
  String name;
  String speakers;
  String region;
  String script;
  String family;
  String notes;
  String officialStatus;
  String languageCode;
  List<String> dialects;
  List<String> relatedLanguages;
  String languageHistory;
  String writingSystem;
  String languageStatus;

  FakeLanguagesModel({
    required this.id,
    required this.name,
    required this.speakers,
    required this.region,
    required this.script,
    required this.family,
    required this.notes,
    required this.officialStatus,
    required this.languageCode,
    required this.dialects,
    required this.relatedLanguages,
    required this.languageHistory,
    required this.writingSystem,
    required this.languageStatus,
  });

  factory FakeLanguagesModel.fromJson(Map<String, dynamic> json) =>
      FakeLanguagesModel(
        id: json["id"],
        name: json["name"],
        speakers: json["speakers"],
        region: json["region"],
        script: json["script"],
        family: json["family"],
        notes: json["notes"],
        officialStatus: json["officialStatus"],
        languageCode: json["languageCode"],
        dialects: List<String>.from(json["dialects"].map((x) => x)),
        relatedLanguages:
            List<String>.from(json["relatedLanguages"].map((x) => x)),
        languageHistory: json["languageHistory"],
        writingSystem: json["writingSystem"],
        languageStatus: json["languageStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "speakers": speakers,
        "region": region,
        "script": script,
        "family": family,
        "notes": notes,
        "officialStatus": officialStatus,
        "languageCode": languageCode,
        "dialects": List<dynamic>.from(dialects.map((x) => x)),
        "relatedLanguages": List<dynamic>.from(relatedLanguages.map((x) => x)),
        "languageHistory": languageHistory,
        "writingSystem": writingSystem,
        "languageStatus": languageStatus,
      };
}
