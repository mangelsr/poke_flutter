import 'package:flutter/material.dart';

import 'package:poke_flutter/pages/pages.dart';

class DrawerProvider with ChangeNotifier {
  // final Map<String, Widget> options = {
  //   'Pokedex': PokemonListPage(),
  //   'Move dex': MoveListPage(),
  // };

  final List<Widget> options = [
    PokemonListPage(),
    MoveListPage(),
  ];

  int selectedOption = 0;

  Widget get actualOption => options[selectedOption];

  changeOption(int newIndex) {
    selectedOption = newIndex;
    notifyListeners();
  }
}
