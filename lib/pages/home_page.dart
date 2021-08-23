import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poke_flutter/widgets/pokemon_tile.dart';
import 'package:poke_flutter/providers/api_provider.dart';

class HomePage extends StatelessWidget {
  static const PAGE_NAME = 'Home';

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pokedex'),
        ),
        body: apiProvider.fetchedPokemon.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: apiProvider.fetchedPokemon.length,
                itemBuilder: (_, int index) {
                  final pokemon = apiProvider.fetchedPokemon[index];
                  return PokemonTile(index: index, pokemon: pokemon);
                },
              ),
      ),
    );
  }
}
