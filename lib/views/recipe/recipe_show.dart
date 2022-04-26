
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/material.dart';

import '../../entity/hive/hive_repo.dart';
import '../../entity/recipe/recipe.dart';
import '../../widgets/recipe_property_show.dart';
import '../../widgets/text_circular_progress.dart';

class RecipeShow extends StatefulWidget {

  final String recipeName;

  const RecipeShow({Key? key, required this.recipeName}): super(key: key);

  @override
  State createState() => _RecipeShowState();
}

class _RecipeShowState extends State<RecipeShow> {

  final double _marginTop = 24.0;
  final double _marginLeft = 16.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Une recette'),
      ),
      body: FutureBuilder(
        // renvoie une Future<dynamic> (dynamic = type variable)
        future: HiveRepo.getDataFromBox('recipes', widget.recipeName),
        // on type AsyncSnapshot avec <dynamic> car la future nous renovie une dynamic
        builder: (BuildContext context, AsyncSnapshot<dynamic> future) {
          if (future.hasData) {
            // La future nous renvoie un string, corespondant à un Json
            // Il faut le traiter ici, afin de transformer ce Json en objet
            Recipe recipe = Recipe.fromJson(future.data);
            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: Text(
                    recipe.name,
                    style: const TextStyle(
                      fontSize: 28,
                      color: CustomColor.bluePokemon
                    ),
                  ),
                ),
                RecipePropertyShow(
                  icon: Icons.people_alt,
                  text: 'Nombre de personne : ',
                  value: recipe.nbPeople.toString(),
                  mLeft: _marginLeft,
                  mTop: _marginTop,
                ),
                RecipePropertyShow(
                  icon: Icons.timelapse,
                  text: 'Temps de préparation : ',
                  value:  recipe.duration.toString(),
                  mLeft: _marginLeft,
                  mTop: _marginTop,
                ),
                Container(
                  margin: EdgeInsets.only(top: _marginTop, left: _marginLeft),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.euro, color: Colors.green),
                      for(int i = 0; i < recipe.price; i++)
                        const Icon(Icons.star, color: Colors.yellow),
                      for(int i = 0; i < (3 - recipe.price); i++)
                        const Icon(Icons.star_border),
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(top: _marginTop, left: _marginLeft),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.stairs_outlined, color: Colors.pink),
                      for(int i = 0; i < recipe.difficulty; i++)
                        const Icon(Icons.star, color: Colors.yellow),
                      for(int i = 0; i < (4 - recipe.difficulty); i++)
                        const Icon(Icons.star_border),
                    ],
                  )
                )
              ],
            );
          }
          return const TextCircularProgress(
            text: 'We are getting your recipe, please wait...',
          );
        },
      ),
    );
  }

}