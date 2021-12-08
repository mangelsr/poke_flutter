import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/widgets/custom_card.dart';

class SpritesCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final Sprites sprites = apiProvider.selectedPokemon.sprites;

    return CustomCard(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: NetworkImage(sprites.frontDefault),
          ),
          Image(
            image: NetworkImage(sprites.backDefault),
          ),
        ],
      ),
    );
  }
}
