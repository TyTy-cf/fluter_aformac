

import 'package:aformacproject/views/digimons/digimons_index.dart';
import 'package:aformacproject/views/pokedex/pokedex_index.dart';
import 'package:aformacproject/views/tinderish/swipes.dart';
import 'package:aformacproject/widgets/button_pokemon.dart';
import 'package:aformacproject/widgets/popupmenu.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Définit le titre de la page où je me situe
        appBar: AppBar(
          title: const Text('Accueil'),
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
                      text: 'Les Pokédex',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PokedexIndex()
                        )
                      ),
                    ),
                    ButtonPokemon(
                      text: 'TinderIsh',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            // Widget d'affichage d'un Pokedex
                            // Il prend en paramètre un objet Pokedex
                            // On lui créé directement à la volée
                              builder: (context) => const Swipes()
                          )
                      ),
                    ),
                    ButtonPokemon(
                      text: 'Digimons',
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            // Widget d'affichage d'un Pokedex
                            // Il prend en paramètre un objet Pokedex
                            // On lui créé directement à la volée
                              builder: (context) => const DigimonIndex()
                          )
                      ),
                    ),
                    Image.asset(
                        'assets/images/star-destroyer.png',
                        width: 280
                    )
                  ],
                ),
              ]
          ),
        )
    );
  }

}