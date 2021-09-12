import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/custom_card.dart';

class AbilitiesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          'Abilities are not used in this game version',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
