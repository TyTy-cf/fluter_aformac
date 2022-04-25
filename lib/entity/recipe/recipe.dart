
import 'package:isar/isar.dart';

part 'recipe.g.dart';

@Collection()
class Recipe {

  @Id()
  int? id = Isar.autoIncrement;

  String name;

  int nbPeople;

  int duration;

  int difficulty;

  int price;

  Recipe(this.name, this.nbPeople, this.duration, this.difficulty, this.price);

}