import 'package:flutter/material.dart';

import 'package:poke_flutter/widgets/learn_methods_filter.dart';
import 'package:poke_flutter/widgets/moves_list.dart';

class MovesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LearnMethodsFilter(),
        MovesList(),
      ],
    );
  }
}
