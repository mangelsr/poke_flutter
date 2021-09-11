import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/providers/api_provider.dart';
import 'package:poke_flutter/widgets/type_badge.dart';

class DetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiProvider apiProvider = Provider.of<ApiProvider>(context);
    final Pokemon pokemon = apiProvider.selectedPokemon;
    final List<String> types =
        pokemon.types.map((Type e) => e.type.name.toUpperCase()).toList();

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      child: ListTile(
        tileColor: Color.fromRGBO(255, 255, 255, 0.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              pokemon.name,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text('#${pokemon.id}'),
          ],
        ),
        subtitle: Row(
          children: types.map((String e) => TypeBadge(e)).toList(),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0),
            ),
          ),
          child:
              Image.network(pokemon.sprites.other.officialArtwork.frontDefault),
        ),
      ),
    );
  }
}
