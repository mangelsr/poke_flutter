import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/api_provider.dart';

class StatsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final Pokemon pokemon = apiProvider.selectedPokemon;

    final int totalStatsValue = pokemon.stats.fold(0,
        (int previousValue, Stat element) => previousValue + element.baseStat);

    final int maxStatValue = pokemon.stats.fold(
        0,
        (int previousValue, Stat element) => element.baseStat >= previousValue
            ? element.baseStat
            : previousValue);

    final Color statNameColor =
        HSLColor.fromColor(pokemon.averageColor).withLightness(0.45).toColor();

    final Color statValueColor =
        HSLColor.fromColor(pokemon.averageColor).withLightness(0.65).toColor();

    final List<Widget> statsBars = pokemon.stats.map((Stat element) {
      final int marginRigth = maxStatValue - element.baseStat;
      return Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  color: statNameColor,
                ),
                child: Center(child: Text(element.stat.name.toUpperCase())),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(
                  right: marginRigth.toDouble(),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: statValueColor,
                ),
                child: Text(
                  element.baseStat.toString(),
                  textAlign: TextAlign.right,
                ),
              ),
            )
          ],
        ),
      );
    }).toList();

    final List<Widget> statsCardContent = [
      ...statsBars,
      Container(
        margin: EdgeInsets.all(8),
        child: Text('TOTAL $totalStatsValue'),
      )
    ];

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: statsCardContent,
      ),
    );
  }
}
