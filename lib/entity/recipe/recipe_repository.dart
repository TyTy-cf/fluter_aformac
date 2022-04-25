
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'recipe.dart';

class RecipeRepository {

  /// Equivalent d'un PDO::connect
  static Future<Isar> _init() async {
    final dir = await getApplicationSupportDirectory(); // path_provider package
    Isar isar = await Isar.open(
      schemas: [RecipeSchema],
      directory: dir.path,
      inspector: true, // if you want to enable the inspector for debug builds
    );
    return isar;
  }

  /// Get all objects from "database"
  static Future<List<Recipe>> getRecipes() async {
    Isar isar = await _init();
    return isar.recipes.buildQuery().findAll() as Future<List<Recipe>>;
  }

  /// Add object to "database"
  static void addRecipe(Recipe recipe) async {
    Isar isar = await _init();
    await isar.writeTxn((isar) async {
      isar.recipes.put(recipe);
    });
  }

}