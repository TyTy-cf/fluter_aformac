
import 'package:aformacproject/entity/pokemon.dart';

class Pokedex {

  String title;
  int startIndex;
  int endIndex;

  Pokedex(this.title, this.startIndex, this.endIndex);

  List<Pokemon> getPokemons() {
    List<Pokemon> pokemons = [];
    for (int i = startIndex; i <= endIndex; i++) {
      pokemons.add(Pokemon(i));
    }
    return pokemons;
  }

}