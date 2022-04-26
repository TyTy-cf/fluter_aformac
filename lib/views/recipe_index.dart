
import 'package:aformacproject/entity/hive/hive_repo.dart';
import 'package:aformacproject/widgets/color/custom_color.dart';
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
            // récupère le contenu de la future, ici c'est la map
            List recipes = future.data as List;
            // logique d'affichage de la vue, lorsque les données sont arrivées
            return ListView.builder(
              // /!\ bien penser à renseigner le nombre d'items à afficher
              itemCount: recipes.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                Recipe recipe = Recipe.fromJson(recipes[index]);
                print(recipe.toJson());
                return Card(
                  elevation: 3,
                  borderOnForeground: false,
                  shadowColor: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          onTap: () {
                            // action à effectuer au "tap" sur une card
                          },
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                recipe.name,
                                style: const TextStyle(
                                  fontSize: 22,
                                  color: CustomColor.bluePokemon
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.euro, color: Colors.green),
                                  for(int i = 0; i < recipe.price; i++)
                                    const Icon(Icons.star, color: Colors.yellow),
                                  for(int i = 0; i < (3 - recipe.price); i++)
                                    const Icon(Icons.star_border),
                                  Container(margin: const EdgeInsets.symmetric(horizontal: 10)),
                                  const Icon(Icons.stairs_outlined, color: Colors.pink),
                                  for(int i = 0; i < recipe.difficulty; i++)
                                    const Icon(Icons.star, color: Colors.yellow),
                                  for(int i = 0; i < (4 - recipe.difficulty); i++)
                                    const Icon(Icons.star_border),
                                ],
                              )
                            ],
                          ),
                          // trailing : code qui viendra s'ajouter sur la partie de droite de ListTile
                          // trailing: IconButton(
                          //   icon: const Icon(Icons.arrow),
                          //   onPressed: () {
                          //     // autre code de redirection eventuelle ?
                          //   },
                          // ),
                        )
                      ]
                    ),
                  ),
                );
              }
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

