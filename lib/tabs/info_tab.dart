import 'package:flutter/material.dart';
import 'package:poke_flutter/widgets/card_title.dart';

import 'package:poke_flutter/widgets/stats_card.dart';

class InfoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CardTitle('Base stats'),
        StatsCard(),
      ],
    );
  }
}
