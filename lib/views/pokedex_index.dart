
import 'package:aformacproject/entity/pokedex.dart';
import 'package:aformacproject/views/pokedex_show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokedexIndex extends StatelessWidget {

  const PokedexIndex({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Définit le titre de la page où je me situe
      appBar: AppBar(
        title: const Text('Liste des Pokedex'),
        actions: [
          PopupMenuButton<int>(
            onSelected: (popupMenuItemClicked) => handleMenuSelected(popupMenuItemClicked),
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                child: Text('Indiquer où je vais aller'),
                value: 0
              ),
              const PopupMenuItem(
                child: Text('An other direction'),
                value: 1
              )
            ]
          )
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
                ElevatedButton(
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
                    child: const Text('Pokedex gen 1')
                ),
                ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PokedexShow(
                                pokedex: Pokedex('Pokedex gen 2', 152, 251)
                            )
                        )
                    ),
                    child: const Text('Pokedex gen 2')
                )
              ] ,
            ),
          ]
        ),
      )
    );
  }

  void handleMenuSelected(int popupMenuItemClicked) {
    if (popupMenuItemClicked == 0) {

    }
    // etc
  }

}