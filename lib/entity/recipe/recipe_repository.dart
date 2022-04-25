
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'recipe.dart';

class RecipeRepository {

  /// Equivalent d'un PDO::connect
  static Future<Isar> init() async {
    final dir = await getApplicationSupportDirectory();
    return await Isar.open(
      schemas: [RecipeSchema],
      directory: dir.path,
    );
  }

  /// Get all objects from "database"
  static Future<dynamic> getRecipes(Isar isar) async {
    return isar.recipes.buildQuery().findAll();
  }

  /// Add object to "database"
  static void addRecipe(Isar isar, Recipe recipe) async {
    await isar.writeTxn((isar) async {
      isar.recipes.put(recipe);
    });
  }

}