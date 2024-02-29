import 'package:flutter_test/flutter_test.dart';
import 'package:pipeline_testing/model/pokemon.dart';

import 'package:pipeline_testing/repository/pokemon_repository.dart';

void main() {
  test('Check get pokemon endpoint', () async {
    PokemonRepositoryImpl pokemonRepository = PokemonRepositoryImpl();
    final pokemon = await pokemonRepository.getPokemon(pokemonName: 'kadabra');

    expect(pokemon.name, 'kadabra');
  });

  test('Check get pokemon endpoint fails', () async {
    PokemonRepositoryImpl pokemonRepository = PokemonRepositoryImpl();
    Pokemon? pokemon;
    try {
  pokemon = await pokemonRepository.getPokemon(pokemonName: 'dsfghjk');
} on Exception catch (e) {
  print(e);
}

    expect(pokemon?.name, null);
  });
}
