// To parse this JSON data, do
//
//     final genreModel = genreModelFromJson(jsonString);

import 'dart:convert';

List<GenreModel> genreModelFromJson(String str) =>
    List<GenreModel>.from(json.decode(str).map((x) => GenreModel.fromJson(x)));

String genreModelToJson(List<GenreModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenreModel {
  int? id;
  String? name;

  GenreModel({
    this.id,
    this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Genlist {
  Genlist._();

  static List<GenreModel> g = [
    GenreModel(id: 28, name: "Action"),
    GenreModel(id: 12, name: "Adventure"),
    GenreModel(id: 16, name: "Animation"),
    GenreModel(id: 35, name: "Comedy"),
    GenreModel(id: 80, name: "Crime"),
    GenreModel(id: 99, name: "Documentary"),
    GenreModel(id: 18, name: "Drama"),
    GenreModel(id: 10751, name: "Family"),
    GenreModel(id: 14, name: "Fantasy"),
    GenreModel(id: 36, name: "History"),
    GenreModel(id: 27, name: "Horror"),
    GenreModel(id: 10402, name: "Music"),
    GenreModel(id: 9648, name: "Mystery"),
    GenreModel(id: 10749, name: "Romance"),
    GenreModel(id: 878, name: "Sci-Fi"),
    GenreModel(id: 10770, name: "TV Movie"),
    GenreModel(id: 53, name: "Thriller"),
    GenreModel(id: 10752, name: "War"),
    GenreModel(id: 37, name: "Western"),
  ];
}
