import 'package:flutter/material.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/providers/navigation_provider.dart';
import 'package:poke_flutter/widgets/custom_card.dart';
import 'package:provider/provider.dart';

class NavigationCard extends StatelessWidget {
  final String firstParagraph =
      'Tap the home button to close all previous Pokémon screens and return to the main screen.';
  final String secondParagraph =
      'Alternatively, tap de buttons below to go to the next or previous Pokémon on the list:';

  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final NavigationProvider navigationProvider =
        Provider.of<NavigationProvider>(context);
    return CustomCard(
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              navigationProvider.changeTab(0);
            },
            style: OutlinedButton.styleFrom(
              primary: apiProvider.selectedPokemon.averageColor,
            ),
            child: Row(
              children: [
                Expanded(flex: 1, child: Icon(Icons.home)),
                Expanded(
                    flex: 9,
                    child: Text(
                      'HOME',
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          SizedBox(height: 10),
          Text(
            firstParagraph,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 10),
          Text(
            secondParagraph,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black45,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
