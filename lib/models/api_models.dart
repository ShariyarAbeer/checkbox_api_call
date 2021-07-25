// To parse this JSON data, do
//
//     final Data = DataFromJson(jsonString);

import 'dart:convert';

Data DataFromJson(String str) => Data.fromJson(json.decode(str));

String DataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    this.count,
    this.entries,
  });

  int count;
  List<Entry> entries;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        count: json["count"],
        entries:
            List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "entries": List<dynamic>.from(entries.map((x) => x.toJson())),
      };
}

class Entry {
  Entry({
    this.api,
    this.description,
    this.auth,
    this.https,
    this.cors,
    this.link,
    this.category,
  });

  String api;
  String description;
  Auth auth;
  bool https;
  Cors cors;
  String link;
  String category;

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        api: json["API"],
        description: json["Description"],
        auth: authValues.map[json["Auth"]],
        https: json["HTTPS"],
        cors: corsValues.map[json["Cors"]],
        link: json["Link"],
        category: json["Category"],
      );

  Map<String, dynamic> toJson() => {
        "API": api,
        "Description": description,
        "Auth": authValues.reverse[auth],
        "HTTPS": https,
        "Cors": corsValues.reverse[cors],
        "Link": link,
        "Category": category,
      };
}

enum Auth { EMPTY, API_KEY, O_AUTH, X_MASHAPE_KEY, USER_AGENT }

final authValues = EnumValues({
  "apiKey": Auth.API_KEY,
  "": Auth.EMPTY,
  "OAuth": Auth.O_AUTH,
  "User-Agent": Auth.USER_AGENT,
  "X-Mashape-Key": Auth.X_MASHAPE_KEY
});

enum Cors { UNKNOWN, NO, YES }

final corsValues =
    EnumValues({"no": Cors.NO, "unknown": Cors.UNKNOWN, "yes": Cors.YES});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
