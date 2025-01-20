// To parse this JSON data, do
//
//     final fakeBooksModel = fakeBooksModelFromJson(jsonString);

import 'dart:convert';

List<FakeBooksModel> fakeBooksModelFromJson(String str) =>
    List<FakeBooksModel>.from(
        json.decode(str).map((x) => FakeBooksModel.fromJson(x)));

String fakeBooksModelToJson(List<FakeBooksModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeBooksModel {
  int id;
  String title;
  String author;
  dynamic publicationYear;
  List<String> genre;
  String description;
  String coverImage;

  FakeBooksModel({
    required this.id,
    required this.title,
    required this.author,
    required this.publicationYear,
    required this.genre,
    required this.description,
    required this.coverImage,
  });

  factory FakeBooksModel.fromJson(Map<String, dynamic> json) => FakeBooksModel(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        publicationYear: json["publication_year"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        description: json["description"],
        coverImage: json["cover_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "publication_year": publicationYear,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "description": description,
        "cover_image": coverImage,
      };
}
