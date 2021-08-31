import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/moves_provider.dart';
import 'package:provider/provider.dart';

class MovesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MovesProvider movesProvider = Provider.of<MovesProvider>(context);
    return Expanded(
      flex: 3,
      child: Container(
        // height: 380,
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListView.builder(
          // shrinkWrap: true,
          itemCount: movesProvider
              .orderedMoves[movesProvider.selectedLearnMethod].length,
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(movesProvider
                .orderedMoves[movesProvider.selectedLearnMethod][index]),
          ),
        ),
      ),
    );
  }
}
