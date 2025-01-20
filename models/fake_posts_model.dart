// To parse this JSON data, do
//
//     final fakePostsModel = fakePostsModelFromJson(jsonString);

import 'dart:convert';

List<FakePostsModel> fakePostsModelFromJson(String str) =>
    List<FakePostsModel>.from(
        json.decode(str).map((x) => FakePostsModel.fromJson(x)));

String fakePostsModelToJson(List<FakePostsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakePostsModel {
  int id;
  String title;
  String content;
  String author;
  DateTime timestamp;
  int likes;
  List<Comment> comments;

  FakePostsModel({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.timestamp,
    required this.likes,
    required this.comments,
  });

  factory FakePostsModel.fromJson(Map<String, dynamic> json) => FakePostsModel(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
        timestamp: DateTime.parse(json["timestamp"]),
        likes: json["likes"],
        comments: List<Comment>.from(
            json["comments"].map((x) => Comment.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "author": author,
        "timestamp": timestamp.toIso8601String(),
        "likes": likes,
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
      };
}

class Comment {
  int id;
  String author;
  String text;

  Comment({
    required this.id,
    required this.author,
    required this.text,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        author: json["author"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "text": text,
      };
}
