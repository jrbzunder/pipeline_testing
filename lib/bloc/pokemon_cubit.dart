import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipeline_testing/bloc/pokemon_state.dart';
import 'package:pipeline_testing/model/pokemon.dart';
import 'package:pipeline_testing/use_cases/get_pokemon.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemon _getPokemon;

  PokemonCubit(this._getPokemon) : super(PokemonInitState());

  void init() {
    emit(PokemonInitState());
  }
  
  void searchPokemon(String pokemonName) async {
      final Pokemon pokemon = await _getPokemon.execute(pokemonName); 
      emit(PokemonLoadedState(pokemon));
  }
}