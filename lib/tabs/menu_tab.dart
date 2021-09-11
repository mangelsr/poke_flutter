import 'package:flutter/material.dart';
import 'package:poke_flutter/widgets/card_title.dart';
import 'package:poke_flutter/widgets/game_version_card.dart';
import 'package:poke_flutter/widgets/navigarion_card.dart';

class MenuTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(height: 10),
        CardTitle('Select game version'),
        GameVersionCard(),
        SizedBox(height: 10),
        CardTitle('Navigation'),
        NavigationCard(),
        SizedBox(height: 10),
      ],
    );
  }
}
