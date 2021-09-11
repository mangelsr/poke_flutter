import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/custom_card.dart';

class GameVersionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Center(
        child: Text(
          'Select a game version in order to see relevant data like base stats, move pools, locations and more',
          style: TextStyle(
            color: Colors.black45,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
