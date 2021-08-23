import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/stats_card.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Text(
          'Base Stats',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
        StatsCard(),
      ],
    );
  }
}
