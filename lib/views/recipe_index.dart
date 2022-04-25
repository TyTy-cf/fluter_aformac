
import 'package:aformacproject/entity/hive/hive_repo.dart';
import 'package:flutter/material.dart';

import '../entity/recipe/recipe.dart';

class RecipeIndex extends StatefulWidget {

  const RecipeIndex({Key? key}): super(key: key);

  @override
  State createState() => _RecipeIndexState();
}

class _RecipeIndexState extends State<RecipeIndex> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Définit le titre de la page où je me situe
      appBar: AppBar(
        title: const Text('Mes recettes'),
      ),
      // Container afin d'englober le contenu de ma page
      body: FutureBuilder(
        // La Future<T>
        future: HiveRepo.getAllToList('recipes'),
        builder: (BuildContext context, AsyncSnapshot<List> future) {
          if (future.hasData) {
            List recipes = future.data as List;
            // logique d'affichage de la vue, lorsque les données sont arrivées
            return ListView.builder(
              itemCount: recipes.length, // récupère le contenu de la future, ici c'est la map
              itemBuilder: (BuildContext context, int index) {
                return Text(Recipe.fromJson(recipes[index]).name);
              },
            );
          }
          // logique d'affiche en attente des données
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  Text('We are getting all you recipes, please wait...')
                ],
              )
            ],
          );
        },
      )
    );
  }

}

