import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/models/pokemon_list.dart';
import 'package:poke_flutter/models/pokemon_specie.dart';
import 'package:poke_flutter/models/type_list_response.dart' as typeList;
import 'package:poke_flutter/models/type_response.dart' as typeResponse;
import 'package:poke_flutter/utils/average_color.dart';

class ApiProvider with ChangeNotifier {
  static const _BASE_URL = 'https://pokeapi.co/api/v2';

  String url = '${_BASE_URL}/pokemon';
  List<Pokemon> displayedPokemon = [];
  Pokemon selectedPokemon;
  PokemonSpecie selectedPokemonSpecie;
  bool fetching = false;
  bool fetchingSpecie = false;
  bool fetchingTypes = false;
  Map<String, typeResponse.DamageRelations> typesTable;

  ApiProvider() {
    getPokemonList();
    getTypesTable();
  }

  getPokemonList() async {
    try {
      fetching = true;
      notifyListeners();
      final response = await http.get(this.url);
      final pokemonResponse = pokemonListFromJson(response.body);
      this.url = pokemonResponse.next;

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
    try {
      fetchingSpecie = true;
      notifyListeners();
      selectedPokemon = displayedPokemon[index];
      selectedPokemonSpecie = await getPokemonSpecie(selectedPokemon);
      notifyListeners();
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      fetchingSpecie = false;
      notifyListeners();
    }
  }

  Future<Map<String, typeResponse.DamageRelations>> buildTypesTable() async {
    try {
      final Map<String, typeResponse.DamageRelations> typesTable = {};
      final response = await http.get('$_BASE_URL/type/');
      final typeList.TypeListResponse result =
          typeList.typeListResponseFromJson(response.body);
      result.results.forEach((typeList.Result element) async {
        final response = await http.get(element.url);
        final typeResponse.TypeResponse result =
            typeResponse.typeResponseFromJson(response.body);
        typesTable[element.name] = result.damageRelations;
      });
      return typesTable;
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  getTypesTable() async {
    try {
      fetchingTypes = true;
      notifyListeners();
      typesTable = await buildTypesTable();
    } catch (err) {
      throw Exception(err.toString());
    } finally {
      fetchingTypes = false;
      notifyListeners();
    }
  }
}
