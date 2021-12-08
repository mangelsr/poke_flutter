import 'package:flutter/material.dart';
import 'package:poke_flutter/widgets/widgets.dart';

class MoreTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        CardTitle('Locations'),
        LocationsCard(),
        SizedBox(height: 10),
        CardTitle('Damage Taken'),
        DamageTakenCard(),
        SizedBox(height: 10),
        CardTitle('Sprites'),
        SpritesCard(),
        SizedBox(height: 10),
        CardTitle('Traning'),
        LocationsCard(),
        SizedBox(height: 10),
      ],
    );
  }
}
