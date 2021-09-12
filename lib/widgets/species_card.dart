import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/widgets/custom_card.dart';

class SpeciesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final Pokemon pokemon = apiProvider.selectedPokemon;

    final double weightKilograms = pokemon.weight / 10;
    final double weightPounds = weightKilograms * 2.20462;
    final String weightKilogramsRounded = weightKilograms.toStringAsFixed(2);
    final String weightPoundsRounded = weightPounds.toStringAsFixed(2);

    final double heightMeters = pokemon.height / 10;
    final double heightFeets = heightMeters * 3.28084;
    final int heightInches = ((heightFeets - heightFeets.floor()) * 12).round();
    final int heightFeetsRounded = heightFeets.floor();
    final String heightMetersRounded = heightMeters.toStringAsFixed(2);

    return CustomCard(
      child: Column(
        children: [
          _SpeciesData(
            title: 'Pokédex entry (from INSERT GAME HERE)',
            content: 'INSERT POKEMON DESCRIPTION HERE',
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: _SpeciesData(
                  title: 'Height',
                  content:
                      '${heightFeetsRounded}\'${heightInches}\'\' (${heightMetersRounded} m)',
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: _SpeciesData(
                  title: 'Weight',
                  content:
                      '${weightPoundsRounded} lbs (${weightKilogramsRounded} kg)',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SpeciesData extends StatelessWidget {
  final String content;
  final String title;

  const _SpeciesData({this.content, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            content,
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black45),
        ),
      ],
    );
  }
}
