import 'package:pipeline_testing/model/pokemon.dart';
import 'package:pipeline_testing/repository/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository _pokemonRepository;

  GetPokemon(this._pokemonRepository);

  Future<Pokemon> execute(String pokemonName) async {
     final pokemon = _pokemonRepository.getPokemon(pokemonName: pokemonName);
     return pokemon; 
  }
}