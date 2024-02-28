import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipeline_testing/Injector.dart';
import 'package:pipeline_testing/bloc/pokemon_cubit.dart';
import 'package:pipeline_testing/bloc/pokemon_state.dart';

void main() {
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pipeline Testing',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final PokemonCubit pokemonCubit = Injector.resolve();
final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Pokemon'),
      ),
      body: Center(
        child: BlocBuilder(
          bloc: pokemonCubit,
          builder: (context, state) {
          if (state is PokemonLoadedState) {
            return Text(state.pokemon.name);
          }
          return Form(
            child: Column(
              children: [
                TextFormField(
                  controller: textController,
                ),
                ElevatedButton(onPressed: () => pokemonCubit.searchPokemon(textController.text), child: Text('Search')),
              ],
            ),
          );
          },
        ),
      ),
    );
  }
}
