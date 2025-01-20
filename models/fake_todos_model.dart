// To parse this JSON data, do
//
//     final fakeTodosModel = fakeTodosModelFromJson(jsonString);

import 'dart:convert';

List<FakeTodosModel> fakeTodosModelFromJson(String str) =>
    List<FakeTodosModel>.from(
        json.decode(str).map((x) => FakeTodosModel.fromJson(x)));

String fakeTodosModelToJson(List<FakeTodosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FakeTodosModel {
  int id;
  String title;
  String description;
  DateTime dueDate;
  Priority priority;
  bool completed;

  FakeTodosModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.completed,
  });

  factory FakeTodosModel.fromJson(Map<String, dynamic> json) => FakeTodosModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        dueDate: DateTime.parse(json["dueDate"]),
        priority: priorityValues.map[json["priority"]]!,
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "dueDate":
            "${dueDate.year.toString().padLeft(4, '0')}-${dueDate.month.toString().padLeft(2, '0')}-${dueDate.day.toString().padLeft(2, '0')}",
        "priority": priorityValues.reverse[priority],
        "completed": completed,
      };
}

enum Priority { HIGH, LOW, MEDIUM }

final priorityValues = EnumValues(
    {"high": Priority.HIGH, "low": Priority.LOW, "medium": Priority.MEDIUM});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
