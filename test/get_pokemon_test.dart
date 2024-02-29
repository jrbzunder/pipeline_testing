import 'package:flutter_test/flutter_test.dart';

import 'package:pipeline_testing/repository/pokemon_repository.dart';

void main() {
  test('Check get pokemon endpoint', () async {
    PokemonRepositoryImpl pokemonRepository = PokemonRepositoryImpl();
    final pokemon = await pokemonRepository.getPokemon(pokemonName: 'kadabra');

    expect(pokemon.name, 'kadabra');
  });
}
