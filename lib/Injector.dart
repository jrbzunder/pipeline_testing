import 'package:get_it/get_it.dart';
import 'package:pipeline_testing/bloc/pokemon_cubit.dart';
import 'package:pipeline_testing/repository/pokemon_repository.dart';
import 'package:pipeline_testing/use_cases/get_pokemon.dart';

class Injector {
  static bool _isInit = false;
  static void setup() {
    if (_isInit) return;
    _isInit = true;
    GetIt getIt = GetIt.I;

// Repositories
    getIt.registerSingleton<PokemonRepository>(PokemonRepositoryImpl());

// Use cases
    getIt.registerSingleton(GetPokemon(getIt()));

// Cubits
    getIt.registerSingleton(PokemonCubit(getIt()));
  }

  static T resolve<T extends Object>() {
    return GetIt.I.get<T>();
  }
}
