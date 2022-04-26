import 'package:aformacproject/entity/recipe/recipe_repository.dart';
import 'package:aformacproject/views/recipe_index.dart';
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:isar/isar.dart';

import '../../entity/hive/hive_repo.dart';
import '../../entity/recipe/recipe.dart';

class RecipeForm extends StatefulWidget {

  const RecipeForm({Key? key}) : super(key: key);

  @override
  State createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {

  final _formKey = GlobalKey<FormBuilderState>();
  Icon iconValidation = const Icon(Icons.check);
  Color primary = CustomColor.bluePokemon;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nouvelle recette'),
        ),
        body: Column(
          children: [
            // Flexible s'utilise seulement dans Column / Row
            Flexible(
                flex: 1,
                child: Wrap(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                      child: FormBuilder(
                          key: _formKey,
                          child: Container(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  FormBuilderTextField(
                                    name: 'name',
                                    decoration: const InputDecoration(
                                      hintText: 'Name',
                                      labelText: 'Name',
                                      icon: Icon(Icons.food_bank)
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: "Veuillez renseigner un nom de recette"
                                      ),
                                    ])
                                  ),
                                  FormBuilderTextField(
                                    name: 'nbPeople',
                                    keyboardType: TextInputType.number,
                                    // masque le contenu de l'input
                                    decoration: const InputDecoration(
                                      hintText: 'Nombre de personne',
                                      labelText: 'Nombre de personne',
                                      icon: Icon(Icons.people_alt)
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: "Veuillez renseigner le nombre de personne"
                                      ),
                                      FormBuilderValidators.minLength(
                                        1,
                                        errorText: "Le nombre de personne minimum est 1"
                                      ),
                                    ]),
                                  ),
                                  FormBuilderTextField(
                                    name: 'duration',
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: 'Temps de préparation',
                                        labelText: 'Temps de préparation',
                                        icon: Icon(Icons.timelapse)
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: "Veuillez renseigner un temps de préparation"
                                      ),
                                      FormBuilderValidators.minLength(
                                        1,
                                        errorText: "Le temps de préparation minimum est 1"
                                      ),
                                    ]),
                                  ),
                                  FormBuilderTextField(
                                    name: 'difficulty',
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                      hintText: 'Difficulté',
                                      labelText: 'Difficulté',
                                      icon: Icon(Icons.stairs)
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: "Veuillez renseigner une difficulté"
                                      ),
                                      FormBuilderValidators.minLength(
                                        1,
                                        errorText: "La difficulté minimum est 1"
                                      ),
                                      FormBuilderValidators.maxLength(
                                        4,
                                        errorText: "La difficulté maximum est 4"
                                      ),
                                    ]),
                                  ),
                                  FormBuilderTextField(
                                    name: 'price',
                                    keyboardType: TextInputType.number,
                                    decoration: const InputDecoration(
                                        hintText: 'Prix',
                                        labelText: 'Prix',
                                        icon: Icon(Icons.euro)
                                    ),
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(
                                        errorText: "Veuillez renseigner un prix"
                                      ),
                                      FormBuilderValidators.minLength(
                                        1,
                                        errorText: "Le prix minimum est 1"
                                      ),
                                    ]),
                                  ),
                                ],
                              )
                          )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          // Icon a tous les incones nécessaires pour une application
                          child: iconValidation,
                          style: ElevatedButton.styleFrom(
                            // onSurface : change la couleur du bouton si disable
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical:  10.0,
                                  horizontal: 16.0
                              ),
                              primary: primary
                          ),
                          onPressed: () async {
                            // etat du formulaire
                            final formState = _formKey.currentState;
                            if (formState != null) {
                              if (formState.saveAndValidate()) {
                                setState(() {
                                  iconValidation = const Icon(Icons.check);
                                  primary = CustomColor.bluePokemon;
                                });
                                Recipe recipe = Recipe(
                                    formState.fields['name']?.value,
                                    int.parse(formState.fields['nbPeople']?.value),
                                    int.parse(formState.fields['duration']?.value),
                                    int.parse(formState.fields['difficulty']?.value),
                                    int.parse(formState.fields['price']?.value)
                                );
                                // Si vous debuggez sur smartphone : go utiliser Isar
                                // Isar isar = await RecipeRepository.init();
                                // RecipeRepository.addRecipe(isar, recipe);
                                // isar.close();
                                HiveRepo.saveDataToBox('recipes', recipe.name, recipe.toJson());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const RecipeIndex()
                                    )
                                );
                                // HiveRepo.getAllMap('recipes').then((value) => print(value));
                              } else {
                                setState(() {
                                  iconValidation = const Icon(Icons.cancel);
                                  primary = Colors.red;
                                });
                              }
                            }
                          },
                        )
                      ],
                    )
                  ],
                )
            ),
          ],
        )
    );
  }
}