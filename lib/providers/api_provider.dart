import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/models/pokemon_list.dart';
import 'package:poke_flutter/models/pokemon_specie.dart';
import 'package:poke_flutter/utils/average_color.dart';

class ApiProvider with ChangeNotifier {
  static const _BASE_URL = 'https://pokeapi.co/api/v2';

  String URL = '${_BASE_URL}/pokemon';
  List<Pokemon> displayedPokemon = [];
  Pokemon selectedPokemon;
  PokemonSpecie selectedPokemonSpecie;
  bool fetching = false;

  ApiProvider() {
    getPokemonList();
  }

  getPokemonList() async {
    try {
      fetching = true;
      notifyListeners();
      final response = await http.get(this.URL);
      final pokemonResponse = pokemonListFromJson(response.body);
      this.URL = pokemonResponse.next;

      final List<Pokemon> pokemon = await Future.wait(pokemonResponse.results
          .map((Result e) async => await getPokemon(e))
          .toList());

      final colors = await Future.wait(pokemon.map((Pokemon e) async =>
          await getImagePalette(
              NetworkImage(e.sprites.other.officialArtwork.frontDefault))));

      for (int i = 0; i < colors.length; i++) {
        pokemon[i].averageColor = colors[i];
      }

      displayedPokemon.addAll(pokemon);
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      fetching = false;
      notifyListeners();
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

  Future<PokemonSpecie> getPokemonSpecie(Pokemon pokemon) async {
    try {
      final response = await http.get(pokemon.species.url);
      return pokemonSpecieFromJson(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  setSelectedPokemon(int index) async {
    selectedPokemon = displayedPokemon[index];
    selectedPokemonSpecie = await getPokemonSpecie(selectedPokemon);
    notifyListeners();
  }
}
