
import 'package:aformacproject/entity/pokedex.dart';
import 'package:aformacproject/entity/pokemon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PokedexShow extends StatefulWidget {

  final Pokedex pokedex;

  // Paramètre Pokedex obligatoire afin de créer mon Widget PokedexShow
  const PokedexShow({Key? key, required this.pokedex}) : super(key: key);

  @override
  State<PokedexShow> createState() => _PokedexShowState();
}

class _PokedexShowState extends State<PokedexShow> {

  int index = 0;
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    super.initState();
    // Dans le initState => appelé qu'une seule fois
    // Je vais récupérer les pokemons de mon pokedex
    // Pour cela je dois utiliser l'attribut "widget" afin d'accéder à l'attribut pokedex
    // de la classe passée en paramètre au State<????>
    pokemons = widget.pokedex.getPokemons();
  }

  void next() {
    setState(() {
      index++;
    });
  }

  void previous() {
    setState(() {
      index--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pokedex.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(pokemons[index].getOfficialArtwork()),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.network(pokemons[index].getFrontHome()),
                  ),
                  Expanded(
                    child: Image.network(pokemons[index].getFrontHomeShiny()),
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        padding: const EdgeInsets.all(10.0)
                    ),
                    // en JS ça donnerai ça :
                    // btn = document.querySelector('buttonPrevious')
                    // btn.addEventListener('click') => onPressed
                    // if index == 0
                    //   btn.addAttribute('disabled', true)
                    // else
                    //   previous()
                    onPressed: index == 0 ? null : () => previous(),
                    child: const Text('Previous')
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(10.0)
                    ),
                    onPressed: index == (pokemons.length - 1) ? null : () => next(),
                    child: const Text('Next')
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}