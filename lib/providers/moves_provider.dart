import 'package:flutter/material.dart';
import 'package:poke_flutter/models/pokemon.dart';

class MovesProvider with ChangeNotifier {
  Map<String, List<String>> orderedMoves;
  String selectedLearnMethod = '';

  MovesProvider();

  setPokemonMoves(Pokemon pokemon) {
    orderedMoves = Map<String, List<String>>();

    pokemon.moves.forEach((Move element) {
      String move = element.move.name;
      Set<String> learnMethods = element.versionGroupDetails
          .map((VersionGroupDetail e) => e.moveLearnMethod.name)
          .toSet();
      learnMethods.forEach((String learnMethod) {
        if (orderedMoves.containsKey(learnMethod)) {
          orderedMoves[learnMethod].add(move);
        } else {
          orderedMoves[learnMethod] = [move];
        }
      });
    });

    selectedLearnMethod = orderedMoves.keys.first;

    notifyListeners();
  }

  setSelectedLearnMethod(String learnMethod) {
    selectedLearnMethod = learnMethod;
    notifyListeners();
  }
}
