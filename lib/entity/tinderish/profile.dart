
import 'dart:convert';

import 'package:flutter/material.dart';

Profile recipeFromJson(String str) => Profile.fromJson(json.decode(str));
String recipeToJson(Profile data) => json.encode(data.toJson());

class Profile {

  IconData gender;
  String firstName;
  String city;
  int age;
  String largeImage;
  String mediumImage;

  Profile({
    required this.gender,
    required this.firstName,
    required this.city,
    required this.age,
    required this.largeImage,
    required this.mediumImage
  });

  factory Profile.fromJson(Map<dynamic, dynamic> json) {
    var jsonData = json["results"][0];
    return Profile(
      gender: jsonData["gender"] == 'female' ? Icons.female : Icons.male,
      firstName: jsonData["name"]["first"],
      city: jsonData["location"]["city"],
      age: jsonData["dob"]["age"],
      largeImage: jsonData["picture"]["large"],
      mediumImage: jsonData["picture"]["medium"],
    );
  }

  Map<dynamic, dynamic> toJson() => {
    "gender": gender == Icons.female ? 'female' : 'male',
    "firstName": firstName,
    "city": city,
    "age": age,
    "largeImage": largeImage,
    "mediumImage": mediumImage,
  };

}