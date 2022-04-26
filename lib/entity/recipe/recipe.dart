
import 'dart:convert';

import 'package:isar/isar.dart';

// part 'recipe.g.dart';

Recipe recipeFromJson(String str) => Recipe.fromJson(json.decode(str));
String recipeToJson(Recipe data) => json.encode(data.toJson());

@Collection()
class Recipe {

  // @Id()
  // int? id = Isar.autoIncrement;

  String name;

  int nbPeople;

  int duration;

  int difficulty;

  int price;

  Recipe(this.name, this.nbPeople, this.duration, this.difficulty, this.price);

  factory Recipe.fromJson(Map<dynamic, dynamic> json) => Recipe(
    json["name"],
    json["nbPeople"],
    json["duration"],
    json["difficulty"],
    json["price"]
  );

  Map<dynamic, dynamic> toJson() => {
    "name": name,
    "nbPeople": nbPeople,
    "duration": duration,
    "difficulty": difficulty,
    "price": price,
  };
}