import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/widgets.dart';

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
