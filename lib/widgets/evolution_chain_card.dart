import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/providers.dart';
import 'package:poke_flutter/utils/string_extension.dart';
import 'package:poke_flutter/widgets/widgets.dart';

class EvolutionChainCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Container(
        height: 250,
        child: Row(
          children: [
            Expanded(child: _VerticalPokemonTile()),
            Expanded(
              child: _LevelArrow(level: 16),
            ),
            Expanded(
              child: _VerticalPokemonTile(),
            ),
            Expanded(
              child: _LevelArrow(level: 32),
            ),
            Expanded(
              child: _VerticalPokemonTile(),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalPokemonTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: apiProvider.selectedPokemon.averageColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 0.5),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0),
              ),
            ),
            child: Image.network(
              apiProvider
                  .selectedPokemon.sprites.other.officialArtwork.frontDefault,
            ),
          ),
          Text(
            '#${apiProvider.selectedPokemon.order.toString().padLeft(3, '0')} ${apiProvider.selectedPokemon.name.toTitleCase()}',
            textAlign: TextAlign.center,
          ),
          Column(
            children: apiProvider.selectedPokemon.types
                .map((Type e) => TypeBadge(e.type.name.toUpperCase()))
                .toList(),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _LevelArrow extends StatelessWidget {
  final int level;

  const _LevelArrow({this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.arrow_forward),
        SizedBox(height: 10),
        Text('Level ${level}'),
      ],
    );
  }
}
