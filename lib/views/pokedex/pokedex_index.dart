

import 'package:aformacproject/entity/pokedex.dart';
import 'package:aformacproject/views/form/search_pokemon.dart';
import 'package:aformacproject/widgets/button_pokemon.dart';
import 'package:aformacproject/widgets/popupmenu.dart';
import 'package:flutter/material.dart';

import 'pokedex_show.dart';

class PokedexIndex extends StatelessWidget {

  const PokedexIndex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Définit le titre de la page où je me situe
      appBar: AppBar(
        title: const Text('Liste des Pokedex'),
        actions: const [
          PopupMenu()
        ],
      ),
      // Container afin d'englober le contenu de ma page
      body: Container(
        // Margin afin que les boutons ne soient pas collés à l'AppBar du haut
        margin: const EdgeInsets.only(top: 10),
        // Row afin de center horizontalement mes éléments
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Colmun afin de placer mes éléments en haut de la page
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Bouton qui lorsque l'on clique dessus, change la page sur laquelle on se trouve
                // Et va vers la bonne version du Pokedex
                ButtonPokemon(
                  text: 'Pokedex gen 1',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Widget d'affichage d'un Pokedex
                        // Il prend en paramètre un objet Pokedex
                        // On lui créé directement à la volée
                        builder: (context) => PokedexShow(
                            pokedex: Pokedex('Pokedex gen 1', 1, 151)
                        )
                      )
                  ),
                ),
                ButtonPokemon(
                  text: 'Pokedex gen 2',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Widget d'affichage d'un Pokedex
                        // Il prend en paramètre un objet Pokedex
                        // On lui créé directement à la volée
                          builder: (context) => PokedexShow(
                              pokedex: Pokedex('Pokedex gen 2', 152, 251)
                          )
                      )
                  ),
                ),
                ButtonPokemon(
                  text: 'Rechercher un Pokémon',
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Widget d'affichage d'un Pokedex
                        // Il prend en paramètre un objet Pokedex
                        // On lui créé directement à la volée
                          builder: (context) => const SearchPokemon()
                      )
                  ),
                ),
                Image.asset(
                  'assets/images/stormtrooper.jpg',
                  width: 240
                )
              ],
            ),
          ]
        ),
      )
    );
  }

}