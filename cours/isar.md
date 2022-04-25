
### 1. Dans le pubspec.yaml

Ajouter dans les dev dependencies :
``
dev_dependencies:
    isar_generator: 2.4.0
    build_runner: any
``

Ajouter dans les dependencies :
``
dependencies:
    path_provider: ^2.0.9
    isar: ^2.4.0
    isar_flutter_libs: ^2.4.0
``

Lancer un
``
flutter pub get
``

Les dépendances du projet sont mises à jour.

### 2. Configuration de la classe "métier"

Voir le fichier recipe.dart :

``
part 'recipe.g.dart';

@Collection()
class Recipe {

    @Id()
    int? id = Isar.autoIncrement;

    // Autres propriétés de la classe
``

Il faut bien penser à ajouter le "part 'recipe.g.dart'" ; où recipe correspond au nom de la classe que vous souhaiter générer

@Collection et @Id sont des annotations propres à Isar.

Lancer un :
``
flutter pub run build_runner build
``

### 3. Configurer le "repository"

La commande précédente a générer un fichier "recipe.g.dart"

Il ressemble à un "schéma" de BDD d'une entité.

Le repository ressemble ensuite à ça :

``
class RecipeRepository {

    /// Equivalent d'un PDO::connect
    static Future<Isar> init() async {
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
        Isar isar = await init();
        return isar.recipes.buildQuery().findAll() as Future<List<Recipe>>;
    }
    
    /// Add object to "database"
    static void addRecipe(Recipe recipe) async {
        Isar isar = await init();
        await isar.writeTxn((isar) async {
            isar.recipes.put(recipe);
        });
    }
}
``



