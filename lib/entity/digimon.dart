
class Digimon {

  String name;
  String img;
  String level;

  Digimon(this.name, this.img, this.level);

  factory Digimon.fromJson(Map<dynamic, dynamic> json) {
    // En paramètres : le nom des champs de mon Json
    return Digimon(
      json['name'],
      json['img'],
      json['level'],
    );
  }
}