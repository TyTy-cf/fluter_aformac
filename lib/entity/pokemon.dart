
class Pokemon {

  int index;

  Pokemon(this.index);

  String getOfficialArtwork() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/'+index.toString()+'.png';
  }

  String getFrontHome() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/'+index.toString()+'.png';
  }

  String getFrontHomeShiny() {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/shiny/'+index.toString()+'.png';
  }

}