import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/widgets.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardTitle('Species'),
        SpeciesCard(),
        SizedBox(height: 10),
        CardTitle('Abilities'),
        AbilitiesCard(),
        SizedBox(height: 10),
        CardTitle('Base stats'),
        StatsCard(),
        SizedBox(height: 10),
        CardTitle('Evolution chain'),
        EvolutionChainCard(),
      ],
    );
  }
}
