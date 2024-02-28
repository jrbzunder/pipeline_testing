import 'dart:convert';

import 'package:pipeline_testing/model/pokemon.dart';
import 'package:http/http.dart' as http;

abstract class PokemonRepository {
  Future<Pokemon> getPokemon({required String pokemonName});
}

class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<Pokemon> getPokemon({required String pokemonName}) async {
    String url = "https://pokeapi.co/api/v2/pokemon/$pokemonName";
    final response = await http.get(Uri.parse(url));

    return Pokemon.fromJson(jsonDecode(response.body));
  }
}