// To parse this JSON data, do
//
//     final fakeMoviesModel = fakeMoviesModelFromJson(jsonString);

import 'dart:convert';

List<FakeMoviesModel> fakeMoviesModelFromJson(String str) =>
    List<FakeMoviesModel>.from(
        json.decode(str).map((x) => FakeMoviesModel.fromJson(x)));

String fakeMoviesModelToJson(List<FakeMoviesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeMoviesModel {
  int id;
  String title;
  int year;
  List<String> genre;
  double rating;
  String director;
  List<String> actors;
  String plot;
  String poster;
  String trailer;
  int runtime;
  String awards;
  Country country;
  Language language;
  String boxOffice;
  String production;
  String website;

  FakeMoviesModel({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.rating,
    required this.director,
    required this.actors,
    required this.plot,
    required this.poster,
    required this.trailer,
    required this.runtime,
    required this.awards,
    required this.country,
    required this.language,
    required this.boxOffice,
    required this.production,
    required this.website,
  });

  factory FakeMoviesModel.fromJson(Map<String, dynamic> json) =>
      FakeMoviesModel(
        id: json["id"],
        title: json["title"],
        year: json["year"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        rating: json["rating"]?.toDouble(),
        director: json["director"],
        actors: List<String>.from(json["actors"].map((x) => x)),
        plot: json["plot"],
        poster: json["poster"],
        trailer: json["trailer"],
        runtime: json["runtime"],
        awards: json["awards"],
        country: countryValues.map[json["country"]]!,
        language: languageValues.map[json["language"]]!,
        boxOffice: json["boxOffice"],
        production: json["production"],
        website: json["website"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "year": year,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "rating": rating,
        "director": director,
        "actors": List<dynamic>.from(actors.map((x) => x)),
        "plot": plot,
        "poster": poster,
        "trailer": trailer,
        "runtime": runtime,
        "awards": awards,
        "country": countryValues.reverse[country],
        "language": languageValues.reverse[language],
        "boxOffice": boxOffice,
        "production": production,
        "website": website,
      };
}

enum Country { USA }

final countryValues = EnumValues({"USA": Country.USA});

enum Language { ENGLISH }

final languageValues = EnumValues({"English": Language.ENGLISH});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
