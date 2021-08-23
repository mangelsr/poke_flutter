import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_flutter/models/pokemon.dart';

import 'package:poke_flutter/models/pokemon_list.dart';
import 'package:poke_flutter/utils/average_color.dart';

class ApiProvider with ChangeNotifier {
  static const _BASE_URL = 'https://pokeapi.co/api/v2/';

  List<Result> pokemonResults = [];
  List<Pokemon> fetchedPokemon = [];
  Pokemon selectedPokemon;

  ApiProvider() {
    getPokemonList();
  }

  getPokemonList() async {
    try {
      final response = await http.get('${_BASE_URL}pokemon?limit=20');
      final pokemonResponse = pokemonListFromJson(response.body);
      pokemonResults.addAll(pokemonResponse.results);

      final pokemon = await Future.wait(pokemonResponse.results
          .map((Result e) async => await getPokemon(e))
          .toList());

      final colors = await Future.wait(pokemon.map((Pokemon e) async =>
          await getImagePalette(
              NetworkImage(e.sprites.other.officialArtwork.frontDefault))));

      for (int i = 0; i < colors.length; i++) {
        pokemon[i].averageColor = colors[i];
      }

      fetchedPokemon.addAll(pokemon);
      notifyListeners();
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  Future<Pokemon> getPokemon(Result pokeResult) async {
    try {
      final response = await http.get(pokeResult.url);
      return pokemonFromJson(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  setSelectedPokemon(int index) {
    selectedPokemon = fetchedPokemon[index];
    notifyListeners();
  }
}
