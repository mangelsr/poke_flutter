import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/providers/moves_provider.dart';

class LearnMethodsFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final MovesProvider movesProvider = Provider.of<MovesProvider>(context);
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 8,
        ),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: movesProvider.orderedMoves.keys
                  .map(
                    (String e) => Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 2),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: apiProvider.selectedPokemon.averageColor,
                          ),
                          onPressed: () {
                            movesProvider.setSelectedLearnMethod(e);
                          },
                          child: Text(
                            e.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 6),
            Text(
              'Move learn methods',
              style: TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
