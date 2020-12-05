import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poke_flutter/widgets/pokemon_tile.dart';
import 'package:poke_flutter/providers/api_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    final apiProvider = Provider.of<ApiProvider>(context);
    return Scaffold(
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
                return PokemonTile(pokemon: pokemon);
              },
            ),
    );
  }
}
