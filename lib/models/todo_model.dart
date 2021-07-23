import 'package:flutter/foundation.dart';

class Todo {
  String id;
  String title;
  String category;
  String body;
  DateTime date;

  Todo({
    this.id,
    @required this.title,
    @required this.category,
    @required this.body,
    @required this.date,
  });

  Todo.fromMap(Map<String, String> data) {
    id = data["id"];
    title = data["title"];
    body = data["body"];
    category = data["category"];
    date = DateTime.parse(data["date"]);
  }

  Map<String, String> toMap() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "category": category,
      "date": date.toString(),
    };
  }
}
