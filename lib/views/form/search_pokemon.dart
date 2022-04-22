
import 'package:aformacproject/entity/pokemon.dart';
import 'package:aformacproject/widgets/button_pokemon.dart';
import 'package:aformacproject/widgets/color/custom_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPokemon extends StatefulWidget {

  const SearchPokemon({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPokemonState();

}

class _SearchPokemonState extends State<SearchPokemon> {

  // Ecoute les changements du champ text sur lequel il est placé
  TextEditingController pokemonNumberController = TextEditingController();
  // Vérifier l'état de notre formulaire (valide, non valide, etc)
  final _formKey = GlobalKey<FormState>();
  Pokemon? _pokemon;

  @override
  void initState() {
    super.initState();
    // printReferences();
  }

  // Exemple de shared_preferences :
  // On récupère la valeur présente dedans
  void printReferences() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("test")) {
      print(prefs.getString("test"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rechercher un Pokémon'),
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
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: pokemonNumberController,
                      decoration: const InputDecoration(
                        // Placeholder de votre input
                        hintText: 'Pokemon number',
                        border: OutlineInputBorder()
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'You must search a number';
                        }
                        if (int.parse(value) < 0 || int.parse(value) > 251) {
                          return 'The number isn t a valid number';
                        }
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonPokemon(
                      text: 'Rechercher',
                      onPressed: () {
                        // etat du formulaire
                        final formState = _formKey.currentState;
                        if (formState != null) {
                          // équivalent de symfony form->validate()
                          if (formState.validate()) {
                            // Action de submit => si form valide
                            setState(() {
                              _pokemon = Pokemon(int.parse(pokemonNumberController.text));
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
          // le if ne fonctionne que pour le Widget en dessous, si la condition
          // est oui
          if (_pokemon != null)
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: CircleAvatar(
                  radius: 180,
                  backgroundColor: CustomColor.bluePokemon,
                  child: Image.network(
                    _pokemon?.getOfficialArtwork() as String,
                    // MediaQuery récupère les infos du téléphone
                    // size récupère les info de la taille du tél
                    // height : sa hauteur
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                )
              )
            )
        ],
      )
    );
  }

}