import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/custom_card.dart';

class LocationsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Center(
        child: Text(
          'No locations found for this game version',
          style: TextStyle(
            color: Colors.black45,
          ),
        ),
      ),
    );
  }
}
