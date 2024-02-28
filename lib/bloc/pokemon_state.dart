import 'package:pipeline_testing/model/pokemon.dart';

abstract class PokemonState {}

class PokemonInitState extends PokemonState {}

class PokemonLoadedState extends PokemonState {
  final Pokemon pokemon;

  PokemonLoadedState(
    this.pokemon,
  );
}

class PokemonErrorState extends PokemonState {}