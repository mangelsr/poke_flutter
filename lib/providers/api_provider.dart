import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:poke_flutter/models/pokemon_list.dart';

class ApiProvider with ChangeNotifier {
  final _BASE_URL = 'https://pokeapi.co/api/v2/';

  List<Result> pokemon = [];

  ApiProvider() {
    getPokemon();
  }

  getPokemon() async {
    try {
      final response = await http.get('${_BASE_URL}pokemon?limit=100');
      final pokemonResponse = pokemonListFromJson(response.body);
      pokemon.addAll(pokemonResponse.results);
      notifyListeners();
    } catch (err) {
      throw Exception(err.toString());
    }
  }
}
